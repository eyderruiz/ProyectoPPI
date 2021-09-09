package uml;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Modelo.Database;
import java.sql.Date;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;

public class daoDomicilio extends Database {

    PreparedStatement pst;
    PreparedStatement pst2;
    PreparedStatement pstId;
    ResultSet rs;

    public boolean registrarServicio(String nombreCliente, String direccionCliente, String telefonoCliente, String ubicacionCliente, String fechaRecogida, String fechaEntrega, int[] idTipoServicio, int[] idPrenda, String estado, int contador) throws SQLException, ParseException {
        System.out.println("Lllego");

        String sql = "insert into DOMICILIOS(ID_DOMICILIO, NOMBRE_CLIENTE, DIRECCION, TELEFONO, EDIFICIO_UNIDAD, FECHA_RECOGIDA, FECHA_ENTREGA, ESTADO, TURNO)values(ID_DOMICILIO.nextval, '" + nombreCliente + "', '" + direccionCliente + "', '" + telefonoCliente + "', '" + ubicacionCliente + "', '" + fechaRecogida + "', '" + fechaEntrega + "', '" + estado + "', " + contador + ")";

        pst = getConnection().prepareStatement(sql);

        if (pst.executeUpdate() == 1) {
            String Sql2 = "select * from domicilios ORDER BY id_domicilio";
            pstId = getConnection().prepareStatement(Sql2);
            rs = pstId.executeQuery();
            String idGenerado = "";
            while (rs.next()) {
                System.out.println(rs.getString(2));
                idGenerado = rs.getString(1);
            }

            System.out.println(idGenerado);

            //String sql2 = "insert into prendas_domicilio(ID_PRENDA_DOMICILIO, ID_DOMICILIO, ID_PRENDA)values(?,?,?)";
            for (int i = 0; i < idPrenda.length; i++) {
                String sql2 = "insert into prendas_domicilio(ID_PRENDA_DOMICILIO, ID_DOMICILIO, ID_PRENDA)values(ID_PRENDA_DOMICILIO.nextval," + idGenerado + ", " + idPrenda[i] + ")";
                pst2 = getConnection().prepareStatement(sql2);
                if (pst2.executeUpdate() == 1) {
                    System.out.println("Detalle prenda guardado");
                } else {
                    System.out.println("Error al tratar de registrar el detalle de prendas");
                }
            }
            for (int i = 0; i < idTipoServicio.length; i++) {
                String sql2 = "insert into servicios_domicilio(ID_SERVICIO_DOMICILIO, ID_DOMICILIO, ID_TIPO_SERVICIO)values(ID_SERVICIO_DOMICILIO.nextval," + idGenerado + ", " + idTipoServicio[i] + ")";
                pst2 = getConnection().prepareStatement(sql2);
                if (pst2.executeUpdate() == 1) {
                    System.out.println("Detalle SERVICIO guardado");
                } else {
                    System.out.println("Error al tratar de registrar el detalle de SERVICIO");
                }
            }

            System.out.println("Servicio registrado correctamente");
            return true;
        } else {
            System.out.println("Error al tratar de registrar el servicio");
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

    public boolean editarServicio(int id, String nombreCliente, String direccionCliente, String telefonoCliente, String ubicacionCliente, String fechaRecogida, String fechaEntrega, int[] idTipoServicio, int[] idPrenda, String estado, int contador) throws SQLException, ParseException {
        System.out.println("Lllego");

        System.out.println(Arrays.toString(idTipoServicio));

        String sql = "update DOMICILIOS set NOMBRE_CLIENTE='" + nombreCliente + "', DIRECCION='" + direccionCliente + "', TELEFONO='" + telefonoCliente + "', EDIFICIO_UNIDAD='" + ubicacionCliente + "', FECHA_RECOGIDA='" + fechaRecogida + "', FECHA_ENTREGA='" + fechaEntrega + "', ESTADO='" + estado + "' where id_domicilio = " + id + "";

        pst = getConnection().prepareStatement(sql);

        if (pst.executeUpdate() == 1) {

            if (idTipoServicio != null) {
                    borrarServiciosDomicilio(id);
                    for (int i = 0; i < idTipoServicio.length; i++) {
                        String sql2 = "insert into servicios_domicilio(ID_SERVICIO_DOMICILIO, ID_DOMICILIO, ID_TIPO_SERVICIO)values(ID_SERVICIO_DOMICILIO.nextval," + id + ", " + idTipoServicio[i] + ")";
                        pst2 = getConnection().prepareStatement(sql2);
                        if (pst2.executeUpdate() == 1) {
                            System.out.println("Detalle SERVICIO guardado");
                        } else {
                            System.out.println("Error al tratar de registrar el detalle de SERVICIO");
                        }
                    }
                
            }

            if (idPrenda != null) {
                borrarPrendasDomicilio(id);
                for (int i = 0; i < idPrenda.length; i++) {
                    String sql2 = "insert into prendas_domicilio(ID_PRENDA_DOMICILIO, ID_DOMICILIO, ID_PRENDA)values(ID_PRENDA_DOMICILIO.nextval," + id + ", " + idPrenda[i] + ")";
                    pst2 = getConnection().prepareStatement(sql2);
                    if (pst2.executeUpdate() == 1) {
                        System.out.println("Detalle prenda guardado");
                    } else {
                        System.out.println("Error al tratar de registrar el detalle de prendas");
                    }
                }

            }

            System.out.println("Servicio registrado correctamente");
            return true;
        } else {
            System.out.println("Error al tratar de registrar el servicio");
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

    public boolean eliminarServicio(int id) throws SQLException {

        String sql = "delete from domicilios where id_domicilio = ?";
        pst = getConnection().prepareStatement(sql);
        pst.setInt(1, id);
        if (pst.executeUpdate() == 1) {
            borrarPrendasDomicilio(id);
            borrarServiciosDomicilio(id);
            System.out.println("Domicilio eliminado");
            return true;
        } else {
            System.out.println("Error al tratar de eliminar el domicilio");
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

    private void borrarServiciosDomicilio(int id) throws SQLException {
        String sql = "delete from SERVICIOS_DOMICILIO where id_domicilio = ?";
        pst = getConnection().prepareStatement(sql);
        pst.setInt(1, id);
        pst.executeUpdate();

    }

    private void borrarPrendasDomicilio(int id) throws SQLException {

        String sql = "delete from prendas_domicilio where id_domicilio = ?";
        pst = getConnection().prepareStatement(sql);
        pst.setInt(1, id);
        pst.executeUpdate();
    }

}
