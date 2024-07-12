/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GCdao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import GCmodel.Category;

/**
 *
 * @author khang
 */
public class CategoryDAO extends DBContext {

    public List getAll() {
        List<Category> categories = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                categories.add(new Category(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3))
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return categories;
    }
}
