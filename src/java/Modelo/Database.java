package Modelo;
import java.sql.*;
public class Database {
    private String driver = "oracle.jdbc.OracleDriver";
    private String url = "jdbc:oracle:thin:@localhost:1521:XE";
    private String usuario = "LAVANDERIA";
    private String contraseña = "lavanderia";
    public Connection con;

    public Database() {
        try {
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(url, usuario, contraseña);
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error"+e);
        }
    }

    public Connection getConnection(){
        return con;
    }
}
