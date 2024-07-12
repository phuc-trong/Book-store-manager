/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Edao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MY LAPTOP
 */
public class OrderDetailDAO extends DBContext{
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderDetailDAO() {
        this.conn = connection;
    }
    
    public ResultSet getListOrderDetailById(String orderDetailId){
        String  sql = "select * from [OrderDetail] od join [Book] f on od.boo_id = f.boo_id  where od.ord_id=?";
        
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, orderDetailId);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
}
