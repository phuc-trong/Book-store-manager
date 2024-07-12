/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mdao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ManagerDAO extends DBContext {

    public boolean isExisted(String username, String password) {
        try {

            String sql = "SELECT * FROM Manager WHERE username = '"+username+"' AND password = CONVERT(VARCHAR(32), HASHBYTES('MD5', '"+password+"'), 2)";
            PreparedStatement ps = connection.prepareStatement(sql);
            //ps.setString(1, username);
            //ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public void updatePassword(String username, String newPassword) {
        try {
            String sql = "UPDATE Manager SET password = CONVERT(VARCHAR(32), HASHBYTES('MD5', ?), 2) WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        ManagerDAO managerDAO = new ManagerDAO();

        // Test isExisted
        boolean isExisted = managerDAO.isExisted("admin", "password");
        System.out.println("Is Existed: " + isExisted);

    }
}
