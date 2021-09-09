<%@page import="java.sql.*"%>
<%@page import="Modelo.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Prenda</title>
        <jsp:include page="head.jsp"></jsp:include>
        <script src="boostrap/js/prendas.js" type="text/javascript"></script>
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
    </head>
    <body>
         <jsp:include page="header.jsp"></jsp:include>
         <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
         <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <div class="container">
            <h3>Editar Prenda</h3>
            <br> 
            <%                         
                        Database con = new Database();
                        PreparedStatement pst = null;
                        ResultSet rs = null;

                        int id = Integer.parseInt(request.getParameter("id"));

                        String sql = "select * from prendas where id_prenda = ?";
                        pst = con.getConnection().prepareStatement(sql);
                        pst.setInt(1, id);
                        rs = pst.executeQuery();

                        while (rs.next()) {

                    %>
                    
                   
                        <form action="" method="post" id="formEditarPrenda">
                            <div class="row">
                               
                                    <div class="col-md-5">
                                        <label>Prenda</label>
                                        <input type="hidden" class="form-control" value="<%= rs.getString(1)%>" id="idPrendaEdit" name="idPrendaEdit">
                                        <input type="text" class="form-control" value="<%= rs.getString(2)%>" id="nombrePrendaEdit" name="nombrePrendaEdit">
                                    </div>                                    
                               
                            </div>
                            <br>

                            <div class="row">
                                                                 
                                    <div class="col-md-1">
    
                                        <input type="button" class="btn btn-success" value="Guardar" id="guardarEditarPrenda">
                                       
                                    </div>
                                    <div class="col-md-2">
                                         <a href="prendas.jsp" class="btn btn-success">Cancelar</a>
                                    </div>
                              
                            </div>
                        </form>
                    
                    <%
                        }
                        pst.close();
                        rs.close();
                        con.getConnection().close();
                    %>
        </div>
       
    </body>
</html>
