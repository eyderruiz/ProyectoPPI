
package uml;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Modelo.Database;

public class daoTipoServicio extends Database {
    PreparedStatement pst;
    ResultSet rs;
    
    
    public boolean nuevoTipoServicio (String nombre) throws SQLException {

        String sql = "insert into tipo_servicios(id_servicio, nombre) values(ID_SERVICIO.nextval, '"+nombre+"')";

        pst = getConnection().prepareStatement(sql);
       // pst.setString(1, tipoVehiculo);

        if (pst.executeUpdate() == 1) {
            System.out.println("Tipo de servicio creado");
            return true;
        }else{
            System.out.println("Error al tratar de crear el tipo de servicio");
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

    public boolean editarTipoServicio(int id, String nombre) throws SQLException {

        String sql = "update tipo_servicios set nombre=? where id_servicio = ?";

        pst = getConnection().prepareStatement(sql);
        pst.setString(1, nombre);
        pst.setInt(2, id);
        if (pst.executeUpdate() == 1) {
            System.out.println("Tipo de servicio editado");
            return true;
        } else {
            System.out.println("Error al tratar de editar el tipo de servicio");
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

    public boolean eliminarTipoServicio(int id) throws SQLException {

        String sql = "delete tipo_servicios where id_servicio = ?";
        pst = getConnection().prepareStatement(sql);
        pst.setInt(1, id);
        if (pst.executeUpdate() == 1) {
            System.out.println("Tipo de servicio eliminado");
            return true;
        } else {
            System.out.println("Error al tratar de eliminar el tipo de servicio");
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
