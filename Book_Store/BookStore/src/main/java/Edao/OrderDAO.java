/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Edao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Emodel.Order;

/**
 *
 * @author MY LAPTOP
 */
public class OrderDAO extends DBContext {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderDAO() {
        this.conn = connection;
    }

    public ResultSet getAll() {
        String sql = "select * from [Order] o join Customer c on c.cus_phone=o.cus_phone order by o.ord_status desc";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet getOrderByEmployeePhone(String employeePhone) {
        String sql = "select * from [Order] o join Customer c on c.cus_phone=o.cus_phone where o.emp_phone=?"
                + " ORDER BY \n"
                + "  CASE \n"
                + "    WHEN ord_status = 'waiting' THEN 1\n"
                + "    WHEN ord_status = 'preparing' THEN 2\n"
                + "    WHEN ord_status = 'completed' THEN 3\n"
                + "    ELSE 4\n"
                + "  END, o.ord_id desc;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, employeePhone);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet getOrderByCustomerPhone(String customerPhone) {
        String sql = "select * from [Order] o join Customer c on c.cus_phone=o.cus_phone where o.cus_phone=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, customerPhone);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet getOrderById(String orderId, String employeePhone) {
        String sql = "select * from [Order] o join Customer c on c.cus_phone=o.cus_phone where o.ord_id like ? and o.emp_phone=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + orderId + "%");
            ps.setString(2, employeePhone);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet getCusOfOrder(String orderId) {
        String sql = "select * from [Order] o join Customer c on c.cus_phone=o.cus_phone where o.ord_id=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, orderId);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet searchOrderByDate(String startDate, String endDate, String employeePhone) {
        String sql = "select * from [Order] o join Customer c on c.cus_phone=o.cus_phone where o.ord_date between ? and ? and o.emp_phone=?"
                + " ORDER BY \n"
                + "  CASE \n"
                + "    WHEN ord_status = 'waiting' THEN 1\n"
                + "    WHEN ord_status = 'preparing' THEN 2\n"
                + "    WHEN ord_status = 'completed' THEN 3\n"
                + "    ELSE 4\n"
                + "  END;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            ps.setString(3, employeePhone);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public int updateOrderStatus(String orderId, String status) {
        String sql = "update [Order] set ord_status=? where ord_id = ?;";
        int kq = 0;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, orderId);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public ResultSet getNewOrder() {
        String sql = "select * from [Order] o join Customer c on c.cus_phone=o.cus_phone where emp_phone=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, "0");
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public int setPhoneForOrder(String employeePhone, String orderId) {
        String sql = "update [Order] set emp_phone=? where ord_id=?";
        int kq = 0;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, employeePhone);
            ps.setString(2, orderId);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }
}
