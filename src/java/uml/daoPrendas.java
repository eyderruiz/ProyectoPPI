package uml;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Modelo.Database;

public class daoPrendas extends Database {

    PreparedStatement pst;
    ResultSet rs;
    
    
    public boolean nuevaPrenda (String nombre) throws SQLException {

        String sql = "insert into prendas(id_prenda, nombre, estado) values(ID_PRENDA.nextval, '"+nombre+"', 'activo')";

        pst = getConnection().prepareStatement(sql);
       // pst.setString(1, tipoVehiculo);

        if (pst.executeUpdate() == 1) {
            System.out.println("Prenda Creada");
            return true;
        }else{
            System.out.println("Error al tratar de crear la prenda");
        }
        try {

        } catch (Exception e) {
            System.err.println("Error" + e);
        } finally {
            try {
                if (getConnection() != null) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.err.println("Error" + e);
            }
        }
        return false;
    }

    public boolean editarPrenda(int id, String nombre) throws SQLException {

        String sql = "update prendas set nombre=? where id_prenda = ?";

        pst = getConnection().prepareStatement(sql);
        pst.setString(1, nombre);
        pst.setInt(2, id);
        if (pst.executeUpdate() == 1) {
            System.out.println("Prenda editada");
            return true;
        } else {
            System.out.println("Error al tratar de editar la prenda");
        }
        try {

        } catch (Exception e) {
            System.err.println("Error" + e);
        } finally {
            try {
                if (getConnection() != null) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.err.println("Error" + e);
            }
        }
        return false;

    }

    public boolean eliminarPrenda(int id) throws SQLException {

        String sql = "update prendas set estado = 'inactivo' where id_prenda = "+id+"";
        pst = getConnection().prepareStatement(sql);
        if (pst.executeUpdate() == 1) {
            System.out.println("Prenda eliminada");
            return true;
        } else {
            System.out.println("Error al tratar de eliminar la prenda");
        }

        try {

        } catch (Exception e) {
            System.err.println("Error" + e);
        } finally {
            try {
                if (getConnection() != null) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.err.println("Error" + e);
            }
        }
        return false;
    }
}
