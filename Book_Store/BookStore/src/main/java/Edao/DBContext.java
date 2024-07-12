/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Edao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author khang
 */
public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://DESKTOP-T24FS6O\\VANSANG:1433;databaseName=Pro_SWP;encrypt=false;trustServerCertificate=true;";
            String username = "sa";
            String password = "12345";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }

    }
}
