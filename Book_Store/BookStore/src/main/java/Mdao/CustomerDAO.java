/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mdao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import java.util.ArrayList;
import java.util.List;
import Mmodel.Customer;

/**
 *
 * @author khang
 */
public class CustomerDAO extends DBContext implements ICRUD<Customer> {

    @Override
    public boolean isExisted(String phone, String password) {
        try {
            String sql = "select * from Customer "
                    + "where cus_phone = '" + phone + "' and cus_password = CONVERT(VARCHAR(20), HASHBYTES('MD5', '" + password + "'), 2)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public void add(Customer customer, String password) {
        try {
            String sql = "INSERT INTO Customer VALUES\n"
                    + "(?, ?, CONVERT(VARCHAR(20), HASHBYTES('MD5', ?), 2), ?, ?, GETDATE(), ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customer.getPhone());
            ps.setString(2, customer.getName());
            ps.setString(3, password);
            ps.setString(4, customer.getAddress());
            ps.setDate(5, customer.getBirthday());
            ps.setInt(6, customer.getCancel_count());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void update(Customer customer) {
        try {
            String sql = "update Customer set  cus_name=?,  cus_address=?, cus_birthday=?, cus_cancel_count=? where cus_phone=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getAddress());
            ps.setDate(3, customer.getBirthday());
            ps.setInt(4, customer.getCancel_count());
            ps.setString(5, customer.getPhone());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void remove(String phone) {
        try {
            String sql = "delete Customer where cus_phone = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public List getAll() {
        List<Customer> customers = new ArrayList<>();
        String sql = "select * from Customer";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String phone = rs.getString(1);
                String name = rs.getString(2);
                String address = rs.getString(4);
                Date birthday = rs.getDate(5);
                Date create_date = rs.getDate(6);
                int cus_cancel_count = rs.getInt(7);
                customers.add(new Customer(phone, name, address, birthday, create_date, cus_cancel_count));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return customers;
    }

    @Override
    public List<Customer> searchByName(String name) {
        List<Customer> customers = new ArrayList<>();
        try {
            String sql = "SELECT * from Customer"
                    + " where cus_name LIKE ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                customers.add(new Customer(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(5),
                        rs.getDate(6),
                        rs.getInt(7)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return customers;
    }

    @Override
    public Customer searchByPhone(String phone) {
        try {
            String sql = "SELECT * "
                    + "FROM Customer where cus_phone = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(rs.getString(1),
                        rs.getString(2),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDate(6),
                        rs.getInt(7)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void changePassword(String phone, String password) {
        String sql = "update Customer set cus_password=convert(varchar(20),hashbytes('MD5',?),2) where cus_phone=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, phone);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Customer> getCusListManagement() {
        List<Customer> listCus = new ArrayList<>();
        String sql = "WITH r AS (\n"
                + "    SELECT\n"
                + "        C.cus_phone,\n"
                + "        COALESCE(SUM(CASE WHEN O.ord_status = 'Completed' THEN 1 ELSE 0 END), 0) AS order_count_completed,\n"
                + "        COALESCE(SUM(CASE WHEN O.ord_status = 'Completed' THEN O.ord_total ELSE 0 END), 0) AS total_completed\n"
                + "    FROM Customer C\n"
                + "    LEFT JOIN [Order] O ON C.cus_phone = O.cus_phone\n"
                + "    GROUP BY C.cus_phone\n"
                + ")\n"
                + "SELECT\n"
                + "    C.cus_name,\n"
                + "    C.cus_phone,\n"
                + "    r.order_count_completed AS order_count,\n"
                + "    r.total_completed\n"
                + "FROM r\n"
                + "JOIN Customer C ON r.cus_phone = C.cus_phone\n"
                + "WHERE C.cus_status != 'Deleted'\n"
                + "ORDER BY C.cus_create desc;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                String phone = rs.getString(2);
                int numOrders = Integer.parseInt(rs.getString(3));
                double totalSpend = rs.getDouble(4);
                listCus.add(new Customer(name, phone, numOrders, totalSpend));
            }
            return listCus;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Customer> getHonorListManagement() {
        List<Customer> listCus = new ArrayList<>();
        String sql = "WITH r AS (\n"
                + "    SELECT\n"
                + "        C.cus_phone,\n"
                + "        COALESCE(SUM(CASE WHEN O.ord_status = 'Completed' THEN 1 ELSE 0 END), 0) AS order_count_completed,\n"
                + "        COALESCE(SUM(CASE WHEN O.ord_status = 'Completed' THEN O.ord_total ELSE 0 END), 0) AS total_completed\n"
                + "    FROM Customer C\n"
                + "    LEFT JOIN [Order] O ON C.cus_phone = O.cus_phone\n"
                + "    GROUP BY C.cus_phone\n"
                + ")\n"
                + "SELECT top (5)\n"
                + "    C.cus_name,\n"
                + "    C.cus_phone,\n"
                + "    r.order_count_completed AS order_count,\n"
                + "    r.total_completed\n"
                + "FROM r\n"
                + "JOIN Customer C ON r.cus_phone = C.cus_phone\n"
                + "WHERE C.cus_status != 'Deleted'"
                + "ORDER BY total_completed DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                String phone = rs.getString(2);
                int numOrders = Integer.parseInt(rs.getString(3));
                double totalSpend = Double.parseDouble(rs.getString(4));
                listCus.add(new Customer(name, phone, numOrders, totalSpend));
            }
            return listCus;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Customer> getBlackListManagement() {
        List<Customer> listCus = new ArrayList<>();
        String sql = "WITH OrderSummary AS (\n"
                + "    SELECT\n"
                + "        c.cus_name,\n"
                + "        c.cus_phone,\n"
                + "        c.cus_status,\n"
                + "        SUM(CASE WHEN o.ord_status = 'Rejected' THEN 1 ELSE 0 END) AS CancelledOrderCount,\n"
                + "        COUNT(DISTINCT o.ord_id) AS TotalOrderCount\n"
                + "    FROM Customer c\n"
                + "    LEFT JOIN [Order] o ON c.cus_phone = o.cus_phone\n"
                + "    GROUP BY c.cus_phone, c.cus_name, c.cus_status\n"
                + ")\n"
                + "SELECT\n"
                + "    cus_name,\n"
                + "    cus_phone,\n"
                + "	cus_status,\n"
                + "    TotalOrderCount,\n"
                + "    CancelledOrderCount\n"
                + "FROM OrderSummary\n"
                + "WHERE cus_status = 'Blocked' OR CancelledOrderCount > 0\n"
                + "ORDER BY cus_status desc, CancelledOrderCount DESC;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                String phone = rs.getString(2);
                String status = rs.getString(3);
                int numOrders = Integer.parseInt(rs.getString(4));
                int cancelCount = Integer.parseInt(rs.getString(5));
                listCus.add(new Customer(name, phone, status, numOrders, cancelCount));
            }
            return listCus;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Customer getCustomerDetail(String cid) {
        try {
            String sql = "WITH OrderSummary AS (\n"
                    + "    SELECT\n"
                    + "        C.cus_phone,\n"
                    + "        COALESCE(COUNT(O.ord_id), 0) AS order_count,\n"
                    + "        COALESCE(SUM(CASE WHEN O.ord_status = 'Rejected' THEN 1 ELSE 0 END), 0) AS cus_cancel_count,\n"
                    + "        COALESCE(SUM(CASE WHEN O.ord_status = 'Completed' THEN 1 ELSE 0 END), 0) AS completed_order_count,\n"
                    + "        COALESCE(SUM(CASE WHEN O.ord_status = 'Completed' THEN O.ord_total ELSE 0 END), 0) AS total_completed\n"
                    + "    FROM Customer C\n"
                    + "    LEFT JOIN [Order] O ON C.cus_phone = O.cus_phone\n"
                    + "    GROUP BY C.cus_phone\n"
                    + ")\n"
                    + "SELECT\n"
                    + "    C.cus_name,\n"
                    + "    C.cus_phone,\n"
                    + "    C.cus_email,\n"
                    + "    C.cus_address,\n"
                    + "    C.cus_birthday,\n"
                    + "    C.cus_create,\n"
                    + "    OS.cus_cancel_count,\n"
                    + "    OS.completed_order_count AS order_count,\n"
                    + "    OS.total_completed AS total_completed,\n"
                    + "    C.cus_status\n"
                    + "FROM Customer C\n"
                    + "JOIN OrderSummary OS ON C.cus_phone = OS.cus_phone\n"
                    + "WHERE C.cus_phone = ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String name = rs.getString(1);
            String phone = rs.getString(2);
            String email = rs.getString(3);
            String address = rs.getString(4);
            Date birthday = rs.getDate(5);//
            Date create_date = rs.getDate(6);
            int cancel_count = rs.getInt(7);
            int numberOrder = rs.getInt(8);
            double totalSpending = rs.getDouble(9);
            String cus_status = rs.getString(10);
            return new Customer(name, phone, email, address, birthday, create_date, cancel_count, numberOrder, totalSpending, cus_status);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteCustomer(String phone) {
        try {
            String sql = "update Customer set cus_status= 'Deleted' where cus_phone= ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void blockCustomer(String phone) {
        try {
            String sql = "update Customer set cus_status= 'Blocked' where cus_phone= ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void unblockCustomer(String phone) {
        try {
            String sql = "update Customer set cus_status= 'Available' where cus_phone= ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getTotalUser() {
        try {
            String sql = "select COUNT(*) from Customer\n"
                    + "where cus_status <> 'Deleted'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Customer> getListNewUser() {
        List<Customer> listNew = new ArrayList<>();
        try {
            String sql = "select top (4) cus_name, cus_create, cus_phone from Customer\n"
                    + "where cus_status <> 'Deleted'\n"
                    + "order by(cus_create) desc ";

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                Date create_date = rs.getDate(2);
                String phone = rs.getString(3);
                String time_ago;
                LocalDate localDateCreate = create_date.toLocalDate();
                time_ago = getTimeAgo(localDateCreate);
                listNew.add(new Customer(name, time_ago, phone));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listNew;
    }

    public Customer getCusInfoForOrder(String cid) {
        try {
            String sql = "select cus_name, a.cus_phone, cus_address from Customer a\n"
                    + "join [Order] b on a.cus_phone=b.cus_phone\n"
                    + "where b.ord_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String name = rs.getString(1);
            String phone = rs.getString(2);
            String address = rs.getString(3);
            return new Customer(name, phone, address, 0);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public String getTimeAgo(LocalDate dateCreate) {
        LocalDate currentDate = LocalDate.now();
        long timeAgo = ChronoUnit.DAYS.between(dateCreate, currentDate);
        return timeAgo == 0 ? "Today" : timeAgo + " Days Ago";
    }

    public static void main(String[] args) {
        CustomerDAO c = new CustomerDAO();
        List<Customer> list = c.getAll();
        System.out.println(c.getCustomerDetail("0123456788").toString());

        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).toString());
        }

        System.out.println(c.isExisted("0123456788", "password2"));

    }
}
