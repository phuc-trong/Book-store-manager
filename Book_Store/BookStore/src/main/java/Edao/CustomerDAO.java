/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Edao;

import jakarta.servlet.jsp.jstl.sql.Result;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Emodel.Customer;

/**
 *
 * @author khang
 */
public class CustomerDAO extends DBContext {

    
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
                customers.add(new Customer(rs.getString(1), rs.getString(2), rs.getString(3), 
                        rs.getString(4), rs.getString(5), rs.getDate(6),
                        rs.getDate(7), rs.getString(8), getCancelCount(rs.getString(1))
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return customers;
    }

    
    public List<Customer> searchByName(String name) {
        List<Customer> customers = new ArrayList<>();
        try {
            String sql = "SELECT * from Customer"
                    + " where cus_name LIKE ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                customers.add(new Customer(rs.getString(1), rs.getString(2), rs.getString(3), 
                        rs.getString(4), rs.getString(5), rs.getDate(6),
                        rs.getDate(7), rs.getString(8), getCancelCount(rs.getString(1))
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return customers;
    }

    
    public Customer searchByPhone(String phone) {
        try {
            String sql = "SELECT * "
                    + "FROM Customer where cus_phone = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new Customer(rs.getString(1), rs.getString(2), rs.getString(3), 
                        rs.getString(4), rs.getString(5), rs.getDate(6),
                        rs.getDate(7), rs.getString(8), getCancelCount(phone)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    
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

    public int getCancelCount(String cusPhone) {
        String cancelCount = "select COUNT(o.ord_id) from Customer c \n"
                + "join [Order] o on c.cus_phone = o.cus_phone and o.ord_status = 'Rejected'\n"
                + "where c.cus_phone=?\n"
                + "group by c.cus_phone";
        try {
            PreparedStatement ps = connection.prepareStatement(cancelCount);
            ps.setString(1, cusPhone);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static void main(String[] args) {
        CustomerDAO c = new CustomerDAO();
        List<Customer> list = c.getAll();
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).toString());
        }

        System.out.println(c.isExisted("0123456788", "password2"));
    }

}
