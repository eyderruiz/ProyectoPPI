
<%@page import="java.sql.*"%>
<%@page import="Modelo.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tipos de Servicio</title>
        <jsp:include page="head.jsp"></jsp:include> 
         <script src="boostrap/js/tipoServicios.js" type="text/javascript"></script>
         <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        </head>
        <body>
        <jsp:include page="header.jsp"></jsp:include>
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <center>
            <h1>Tipo De Servicio</h1>
        </center>
        <br>
        <div class="container"> 
            
            <a href="nuevoTipoServicio.jsp" class="btn btn-outline-success">Nuevo</a>
            <br><br>
            <table class="table table-striped table-responsive">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th></th>
                    </tr>
                <%
                    try {
                        Database con = new Database();
                        PreparedStatement pst = null;
                        ResultSet rs = null;
                        //String sql = "Select * from servicio";
                        String sql = "select * from tipo_servicios";
                        pst = con.getConnection().prepareStatement(sql);
                        rs = pst.executeQuery();

                        while (rs.next()) {

                %>
                <tr>
                    <td>
                        <%=rs.getString(2)%>
                    </td>
                    <td>
                        <a class="btn btn-primary" href="editarTipoServicio.jsp?id=<%=rs.getString(1)%>">Editar</a>
                        <button class="btn btn-danger" onclick="eliminarTipoServicio(<%=rs.getString(1)%>)">
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
