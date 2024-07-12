/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Mmodel.Order;

/**
 *
 * <<<<<<< HEAD @a
 *
 *
 * uthor Khanh
 */
public class OrderDAO extends DBContext {

    public List<Order> getOrderHistory(String phone) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "select ord_id, ord_status, ord_date from [Order]\n"
                    + "where cus_phone = ? \n"
                    + "order by(ord_date) desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rz = ps.executeQuery();
            while (rz.next()) {
                list.add(new Order(rz.getString(1),
                        rz.getString(2),
                        rz.getDate(3)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> getOrderServed(String phone) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "select ord_id, ord_status, ord_date from [Order] where emp_phone = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rz = ps.executeQuery();
            while (rz.next()) {
                list.add(new Order(rz.getString(1),
                        rz.getString(2),
                        rz.getDate(3)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalOrder() {
        try {
            String sql = "select COUNT(*) from [Order] where ord_status = 'Completed'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public double getTotalRevenue() {
        try {
            String sql = "select sum(ord_total) from [Order] where ord_status = 'Completed'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getDouble(1);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Order> getRecentOrder() {
        List<Order> listReOrder = new ArrayList<>();
        try {
            String sql = "select top(5) ord_id, cus_phone, ord_date, ord_status from [Order]\n"
                    + "order by(ord_date) desc, (ord_id) desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listReOrder.add(new Order(rs.getString(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getString(4)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listReOrder;
    }

    public List<Order> getListOrderManagement() {
        List<Order> listOrder = new ArrayList<>();
        try {
            String sql = "SELECT ord_id, ord_status, ord_date, cus_phone, ord_pay, ord_total FROM [Order]\n"
                    + "order by(ord_date) desc, ord_id desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listOrder.add(new Order(rs.getString(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listOrder;
    }

    public Order getOrderInfo(String oid) {
        try {
            String sql = "select ord_status, b.emp_name, ord_type, ord_pay, ord_date, ord_note from [Order] a\n"
                    + "join Employee b on a.emp_phone=b.emp_phone\n"
                    + "where a.ord_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, oid);
            ResultSet rz = ps.executeQuery();
            rz.next();
            return new Order(
                    rz.getString(1),
                    rz.getString(2),
                    rz.getString(3),
                    rz.getString(4),
                    rz.getDate(5),
                    rz.getString(6)
            );
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
