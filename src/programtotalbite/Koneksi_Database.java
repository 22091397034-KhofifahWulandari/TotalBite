/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package programtotalbite;

import com.mysql.jdbc.Statement;
import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author khofi
 */
public class Koneksi_Database {
    static final String jdbc_driver = "com.mysql.jdbc.Driver";
    static final String url = "jdbc:mysql://localhost:3306/totalbite";
    static final String user = "root";
    static final String pass = "";
    static Connection conn;
    static Statement stat;
    static ResultSet rs;
    
    public static Connection connectDatabase(){
        try{
            Class.forName(jdbc_driver);
        } catch(ClassNotFoundException cnf) { 
            
        } try {
            conn = DriverManager.getConnection(url, user, pass);
            JOptionPane.showMessageDialog(null, "Koneksi Database Berhasil"); 
        } catch (SQLException e){
            JOptionPane.showMessageDialog(null, "Koneksi Database Gagal");
        } catch (HeadlessException e){
            
        }
        return conn;
    }
    
}
