<%@page import="java.sql.*"%>
<%@page import="Modelo.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Prenda</title>
        <jsp:include page="head.jsp"></jsp:include>
            <script src="boostrap/js/servicios.js" type="text/javascript"></script>
            <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        </head>
        <body>
        <jsp:include page="header.jsp"></jsp:include>
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <div class="container">
                <h3>Detalle del servicio</h3>
                <br> 
                <div class="container">
                    <div class="row">
                    <%
                        Database con = new Database();
                        PreparedStatement pst = null;
                        ResultSet rs = null;

                        int id = Integer.parseInt(request.getParameter("id"));

                        String sql = "select *  from domicilios where id_domicilio = ?";
                        pst = con.getConnection().prepareStatement(sql);
                        pst.setInt(1, id);
                        rs = pst.executeQuery();

                        while (rs.next()) {

                    %>

                    <div class="col-md-3">
                        <b> <label>Nombre Cliente: </label> </b> <%= rs.getString(2)%>
                    </div>

                    <div class="col-md-3">
                        <b> <label>Direccion Cliente: </label> </b> <%= rs.getString(3)%>
                    </div>

                    <div class="col-md-3">
                        <b> <label>Teléfono Cliente: </label>  </b> <%= rs.getString(4)%>
                    </div>

                    <div class="col-md-3">
                         <b><label>Edificio/Unidad Cliente: </label>  </b> <%= rs.getString(5)%>
                    </div>
                    <div class="col-md-3">
                        <br>                       
                        <b> <label>Fecha de recogida:   </label>  </b> <%=rs.getString(7)%>                         
                     </div>
                    
                     <div class="col-md-3">
                          <br>
                     <b> <label>Fecha de entrega: </labe>  </b>  <%=rs.getString(6)%>
                     </div>                       

                    <%
                        }

                        pst.close();
                        rs.close();
                        con.getConnection().close();
                    %>
                </div>
                <br> 
                <b>Prendas</b>
                <br>
                <div class="row">
                    <ul>  <%
                            Database con2 = new Database();
                            PreparedStatement pst2 = null;
                            ResultSet rs2 = null;

                            String sql2 = "select pr.nombre  from domicilios dm join prendas_domicilio pd on dm.id_domicilio = pd.id_domicilio join prendas pr on pr.id_prenda = pd.id_prenda  where dm.id_domicilio = ?";
                            pst2 = con2.getConnection().prepareStatement(sql2);
                            pst2.setInt(1, id);
                            rs2 = pst2.executeQuery();

                            while (rs2.next()) {

                        %>

                        <li>
                            <%= rs2.getString(1)%>
                        </li>


                        <%
                            }
                            pst2.close();
                            rs2.close();
                            con2.getConnection().close();
                        %>
                    </ul>
                </div>
                <b>Servicios</b>
                <br>
                <div class="row">
                    <ul>
                        <%
                            Database con3 = new Database();

                            PreparedStatement pst3 = null;
                            ResultSet rs3 = null;

                            String sql3 = "select ts.nombre  from domicilios dm join servicios_domicilio sd on dm.id_domicilio = sd.id_domicilio join tipo_servicios ts on ts.id_servicio = sd.id_tipo_servicio  where dm.id_domicilio = ?";
                            pst3 = con3.getConnection().prepareStatement(sql3);
                            pst3.setInt(1, id);
                            rs3 = pst3.executeQuery();

                            while (rs3.next()) {

                        %>

                        <li>
                            <%= rs3.getString(1)%>
                        </li>


                        <%
                            }
                            pst3.close();
                            rs3.close();
                            con3.getConnection().close();
                        %>
                    </ul>
                </div>
                <br>
                <a href="index.jsp" class="btn btn-success" class="btn btn-default">Volver</a>
            </div>
        </div>

    </body>
    <footer>
         <jsp:include page="footer.jsp"></jsp:include>
    </footer>
</html>
