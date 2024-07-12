/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mdao;

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
            String url = "jdbc:sqlserver://TRONG\\PHUCTRONG:1433;databaseName=Pro_SWP;encrypt=false;trustServerCertificate=true;";
            String username = "sa";
            String password = "trong2203";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("ok");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }

    }
    
    public static void main(String[] args) {
        DBContext c = new DBContext();
    }
}
