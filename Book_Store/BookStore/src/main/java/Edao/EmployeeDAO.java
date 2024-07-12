/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Edao;

import Encrypt.MD5;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Emodel.Employee;

/**
 *
 * @author khang
 */
public class EmployeeDAO extends DBContext {
    MD5 encypt = new MD5();
    public Employee login(String phone, String password) {
        String sql = "select * from employee where emp_phone = ? and emp_password = ?";
//        String sql = "select * from employee where emp_phone = '"+phone+"' and emp_password = CONVERT(VARCHAR(20), HASHBYTES('MD5', '"+password+"'), 2)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.setString(2, encypt.getMd5(password));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Employee(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getDate(6), rs.getDate(7), rs.getString(8)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void add(Employee employee, String password) {
        try {
            String sql = "insert into [Employee] values"
                    + "(?,?,CONVERT(VARCHAR(20), HASHBYTES('MD5', ?), 2),"
                    + "?,?,getdate())";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, employee.getPhone());
            ps.setString(2, employee.getName());
            ps.setString(3, password);
            ps.setString(4, employee.getAddress());
            ps.setDate(5, employee.getBirthday());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    
    public void update(Employee employee) {
        try {
            String sql = "update employee set  emp_name=?,  emp_address=?, emp_birthday=? where emp_phone=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, employee.getName());
            ps.setString(2, employee.getAddress());
            ps.setDate(3, employee.getBirthday());
            ps.setString(4, employee.getPhone());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    
    public void remove(String phone) {
        try {
            String sql = "delete Employee where emp_phone = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    
    public List getAll() {
        List<Employee> list = new ArrayList<>();
        try {
            String sql = "select * from Employee";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employee(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getDate(6), rs.getDate(7), rs.getString(8)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    
    public List searchByName(String name) {
        List<Employee> list = new ArrayList<>();
        try {
            String sql = "select * from Employee  where emp_name LIKE ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employee(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getDate(6), rs.getDate(7), rs.getString(8)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    
    public Employee searchByPhone(String phone) {
        try {
            String sql = "select * from Employee where emp_phone = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Employee(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getDate(6), rs.getDate(7), rs.getString(8)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    
    public void changePassword(String phone, String password) {
//        String sql = "update employee set emp_password=convert(varchar(20),hashbytes('MD5','"+password+"'),2) where emp_phone='"+phone+"'";
        String sql = "update employee set emp_password=? where emp_phone=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, encypt.getMd5(password));
            ps.setString(2, phone);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public int updateProfile(String phone, String name, String email, String address, String birthday, String create) {
        String sql = "update employee set emp_name=?, emp_email=?, emp_address=?, emp_birthday=?, emp_create=? where emp_phone=?";
        int kq = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, address);
            ps.setString(4, birthday);
            ps.setString(5, create);
            ps.setString(6, phone);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public Employee checkEmployeeEmail(String email) {
        try {
            String sql = "select * from Employee where emp_email = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Employee(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getDate(6), rs.getDate(7), rs.getString(8)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void updateEmployeePass(String password, String email) {
        String sql = "update Employee set emp_password=? where emp_email=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, encypt.getMd5(password));
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
   
}
