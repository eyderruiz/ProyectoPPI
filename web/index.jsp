
<%@page import="java.sql.*"%>
<%@page import="Modelo.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Servicios</title>
        <jsp:include page="head.jsp"></jsp:include> 
         <script src="boostrap/js/servicios.js" type="text/javascript"></script>
         <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        </head>
        <body>
        <jsp:include page="header.jsp"></jsp:include>
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <center>
            <h1>Orden Servicio</h1>
        </center>
        <br>
        <div class="container"> 
            
            <a href="nuevoServicio.jsp" class="btn btn-outline-success">Nuevo</a>
            <br><br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Nombre Cliente</th>
                        <th>Dirección Cliente</th>
                        <th>Teléfono Cliente</th>
                        <th>Unidad/Edificio</th>                                               
                        <th>Fecha de recogida</th>
                        <th>Fecha de entrega</th>                        
                        <th>Estado</th>
                        <th>Detalle Servicio</th>
                        <th style="width: 17%;">Acciones</th>
                        
                    </tr>
                  <%
                    try {
                        Database con = new Database();
                        PreparedStatement pst = null;
                        ResultSet rs = null;
                        //String sql = "Select * from servicio";
                        String sql = "select * from domicilios";
                        pst = con.getConnection().prepareStatement(sql);
                        rs = pst.executeQuery();

                        while (rs.next()) {

                %>            
                <tr>
                    
                    <td>
                        <%=rs.getString(2)%>
                    </td>
                    <td>
                        <%=rs.getString(3)%>
                    </td>
                    <td>
                        <%=rs.getString(4)%>
                    </td>
                    <td>
                        <%=rs.getString(5)%>
                    </td>
                    <td>
                        <%=rs.getString(7)%>
                    </td>
                    <td>
                        <%=rs.getString(6)%>
                    </td>
                    
                    
                     <td>
                        <%=rs.getString(9)%>
                    </td>
                     <td>
                      
                        <a href="verServicio.jsp?id=<%=rs.getString(1)%>" class="btn btn-link">
                            Ver
                        </a>
                        
                    </td>
                    
                    <td>
                        <a class="btn btn-primary" href="editarServicio.jsp?id=<%=rs.getString(1)%>">Editar</a>
                        <button class="btn btn-danger" onclick="eliminarServicio(<%=rs.getString(1)%>)">
                            Eliminar
                        </button>
                        
                    </td>
                </tr>
                <%}

                        pst.close();
                        rs.close();
                        con.getConnection().close();

                    } catch (Exception e) {
                        System.err.println("Error" + e);
                    }
                %>
            </thead>
        </table>
            
    </div>
</body>
   <footer>
         <jsp:include page="footer.jsp"></jsp:include>
    </footer>

</html>

