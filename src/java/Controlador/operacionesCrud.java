package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uml.daoDomicilio;
import uml.daoPrendas;
import uml.daoTipoServicio;

@WebServlet(name = "operacionesCrud", urlPatterns = {"/operacionesCrud"})
public class operacionesCrud extends HttpServlet {

    int contador = 0;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        if ("editarPrenda".equals(request.getParameter("opcion"))) {
            int idPrenda = Integer.parseInt(request.getParameter("idPrenda"));
            String nombrePrenda = request.getParameter("nombrePrenda");
            daoPrendas daoP = new daoPrendas();
            try {
                if (daoP.editarPrenda(idPrenda, nombrePrenda)) {
                    out.println("true");
                } else {
                    out.println("false");
                }
            } catch (SQLException ex) {

            }
        } else if ("eliminarPrenda".equals(request.getParameter("opcion"))) {
            int idPrenda = Integer.parseInt(request.getParameter("idPrenda"));
            daoPrendas daoP = new daoPrendas();
            try {
                if (daoP.eliminarPrenda(idPrenda)) {
                    out.println("true");
                } else {
                    out.println("false");
                }
            } catch (SQLException ex) {

            }
        } else if ("nuevaPrenda".equals(request.getParameter("opcion"))) {

            String nombrePrenda = request.getParameter("nombrePrenda");
            daoPrendas daoP = new daoPrendas();
            try {
                if (daoP.nuevaPrenda(nombrePrenda)) {
                    out.println("true");
                } else {
                    out.println("false");
                }
            } catch (SQLException ex) {

            }
        } else if ("editarTipoServicio".equals(request.getParameter("opcion"))) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            daoTipoServicio daoP = new daoTipoServicio();
            try {
                if (daoP.editarTipoServicio(id, nombre)) {
                    out.println("true");
                } else {
                    out.println("false");
                }
            } catch (SQLException ex) {

            }
        } else if ("eliminarTipoServicio".equals(request.getParameter("opcion"))) {
            int id = Integer.parseInt(request.getParameter("id"));
            daoTipoServicio daoP = new daoTipoServicio();
            try {
                if (daoP.eliminarTipoServicio(id)) {
                    out.println("true");
                } else {
                    out.println("false");
                }
            } catch (SQLException ex) {

            }
        } else if ("nuevaTipoServicio".equals(request.getParameter("opcion"))) {

            String nombre = request.getParameter("nombre");
            daoTipoServicio daoP = new daoTipoServicio();
            try {
                if (daoP.nuevoTipoServicio(nombre)) {
                    out.println("true");
                } else {
                    out.println("false");
                }
            } catch (SQLException ex) {

            }
        } else if ("nuevoServicio".equals(request.getParameter("opcion"))) {
            contador++;
            String[] ArrayTipoServicios = request.getParameterValues("idTipoServicio[]");
            String[] ArrayPrendas = request.getParameterValues("idPrendas[]");
            //System.out.println(Arrays.toString(ArrayValoresServicios));
            int idTipoServicio[];
            int idPrenda[];
            idPrenda = new int[ArrayPrendas.length];
            idTipoServicio = new int[ArrayTipoServicios.length];

            for (int i = 0; i < ArrayTipoServicios.length; i++) {
                idTipoServicio[i] = Integer.parseInt(ArrayTipoServicios[i]);
            }

            for (int i = 0; i < ArrayPrendas.length; i++) {
                idPrenda[i] = Integer.parseInt(ArrayPrendas[i]);
            }

            String nombreCliente = request.getParameter("nombreCliente");
            String direccionCliente = request.getParameter("direccionCliente");
            String telefonoCliente = request.getParameter("telefonoCliente");
            String ubicacionCliente = request.getParameter("ubicacionCliente");
            String fechaHoraRecogida = request.getParameter("fechaHoraRecogida");
            String fechaHoraEntrega = request.getParameter("fechaHoraEntrega");
            String estado = request.getParameter("estado");
            

            daoDomicilio daoP = new daoDomicilio();
            try {
                if (daoP.registrarServicio(nombreCliente, direccionCliente, telefonoCliente, ubicacionCliente, fechaHoraRecogida, fechaHoraEntrega, idTipoServicio, idPrenda, estado, contador)) {
                    out.println("true");
                } else {
                    out.println("false");
                }
            } catch (SQLException ex) {

            } catch (ParseException ex) {
                Logger.getLogger(operacionesCrud.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if ("editarServicio".equals(request.getParameter("opcion"))) {
            contador++;
            String[] ArrayTipoServicios = request.getParameterValues("idTipoServicio[]");
            String[] ArrayPrendas = request.getParameterValues("idPrendas[]");
            int idTipoServicio[] = null;
            int idPrenda[] = null;
            if (ArrayPrendas != null) {
                System.out.println("aaaaa");
                idPrenda = new int[ArrayPrendas.length];
                for (int i = 0; i < ArrayPrendas.length; i++) {
                    idPrenda[i] = Integer.parseInt(ArrayPrendas[i]);
                }
            }
            
            if(ArrayTipoServicios != null){
                
                idTipoServicio = new int[ArrayTipoServicios.length];
                for (int i = 0; i < ArrayTipoServicios.length; i++) {
                idTipoServicio[i] = Integer.parseInt(ArrayTipoServicios[i]);
            }
            }

            String nombreCliente = request.getParameter("nombreCliente");
            String direccionCliente = request.getParameter("direccionCliente");
            String telefonoCliente = request.getParameter("telefonoCliente");
            String ubicacionCliente = request.getParameter("ubicacionCliente");
            String fechaHoraRecogida = request.getParameter("fechaHoraRecogida");
            String fechaHoraEntrega = request.getParameter("fechaHoraEntrega");
            String estado = request.getParameter("estado");
            int id = Integer.parseInt(request.getParameter("id"));

            daoDomicilio daoP = new daoDomicilio();
            try {
                if (daoP.editarServicio(id, nombreCliente, direccionCliente, telefonoCliente, ubicacionCliente, fechaHoraRecogida, fechaHoraEntrega, idTipoServicio, idPrenda, estado, contador)) {
                    out.println("true");
                } else {
                    out.println("false");
                }
            } catch (SQLException ex) {

            } catch (ParseException ex) {
                Logger.getLogger(operacionesCrud.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if ("eliminarServicio".equals(request.getParameter("opcion"))) {
            int id = Integer.parseInt(request.getParameter("id"));
            daoDomicilio daoP = new daoDomicilio();
            try {
                if (daoP.eliminarServicio(id)) {
                    out.println("true");
                } else {
                    out.println("false");
                }
            } catch (SQLException ex) {

            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
