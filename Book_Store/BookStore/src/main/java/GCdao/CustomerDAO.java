/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GCdao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import GCmodel.Customer;

/**
 *
 * @author khang
 */
public class CustomerDAO extends DBContext {

    public boolean isPhoneExisted(String phone) {
        try {
            String sql = "select * from Customer "
                    + "where cus_phone = '" + phone + "'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public Customer GetCustomer(String email) {

        try {
            String sql = "select * from Customer where cus_email = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getDate(7),
                        rs.getString(8)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean isExisted(String phone, String password) {
        try {
            String sql = "select * from Customer "
                    + "where cus_phone = '" + phone + "' and cus_password = CONVERT(VARCHAR(32), HASHBYTES('MD5', '" + password + "'), 2)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public void update(Customer customer) {
        try {
            String sql = "update Customer set cus_name=?, cus_email=?,\n"
                    + "cus_address=?, cus_birthday=?\n"
                    + "where cus_phone =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getEmail());
            ps.setString(3, customer.getAddress());
            ps.setDate(4, customer.getBirthday());
            ps.setString(5, customer.getPhone());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        CustomerDAO c = new CustomerDAO();
        System.out.println(c.isEmailExisted("khangta67@gmailuy.com"));
    }

    public void add(Customer customer, String password) {
        try {
            String sql = "INSERT INTO Customer VALUES\n"
                    + "(?, ?, CONVERT(VARCHAR(32), HASHBYTES('MD5', '" + password + "'), 2), ?, ?,?, GETDATE(), 'Available')";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customer.getPhone());
            ps.setString(2, customer.getName());
            ps.setString(3, customer.getEmail());
            ps.setString(4, customer.getAddress());
            ps.setDate(5, customer.getBirthday());
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
                customers.add(
                        new Customer(rs.getString(1),
                                rs.getString(2),
                                rs.getString(4),
                                rs.getString(5),
                                rs.getDate(6),
                                rs.getDate(7),
                                rs.getString(8)
                        )
                );
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
                return new Customer(rs.getString(1),
                        rs.getString(2),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getDate(7),
                        rs.getString(8)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean isEmailExisted(String email) {
        try {
            String sql = "SELECT * "
                    + "FROM Customer where LOWER(cus_email) = LOWER(?)  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void changePassword(String phone, String password) {
        String sql = "update Customer set "
                + "cus_password=convert(varchar(32),hashbytes('MD5','" + password + "'),2) where cus_phone='" + phone + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void forgotPassword(String password, String email) {
        String sql = "update Customer set "
                + "cus_password=convert(varchar(32),hashbytes('MD5','" + password + "'),2) where cus_email='" + email + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
