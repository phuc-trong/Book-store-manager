/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mdao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Mmodel.OrderDetail;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO extends DBContext {

    public List<OrderDetail> getListOrderDetail(String orderId) {
        List listOrderDetail = new ArrayList<>();
        try {
            String sql = "SELECT F.boo_id, F.boo_img, F.boo_name, ROUND((F.boo_price - (F.boo_price * (F.boo_sale / 100))), 2) AS unit_price, OD.quantity, ROUND((F.boo_price - (F.boo_price * (F.boo_sale / 100))) * OD.quantity, 2) AS total_price\n"
                    + "FROM Book F\n"
                    + "JOIN OrderDetail OD ON F.boo_id = OD.boo_id\n"
                    + "JOIN [Order] O ON O.ord_id = OD.ord_id\n"
                    + "WHERE O.ord_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listOrderDetail.add(new OrderDetail(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getDouble(6))
                );
            }
            return listOrderDetail;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
