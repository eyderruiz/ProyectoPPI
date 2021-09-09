<%@page import="java.sql.*"%>
<%@page import="Modelo.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Domicilio</title>
        <jsp:include page="head.jsp"></jsp:include>
            <script src="boostrap/js/servicios.js" type="text/javascript"></script>
            <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        </head>
        <body>
        <jsp:include page="header.jsp"></jsp:include>
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <div class="container">
                <h3>Nueva Orden de Servicio</h3>
                <br> 

                <form action="" method="post" id="formNuevoServicio">

                    <div class="row">
                        <div class="col-md-3">
                            <label>Nombre Cliente</label>
                            <input type="text" class="form-control" value="" id="nombreClienteNew" name="nombreClienteNew">
                        </div>

               
                        <div class="col-md-3">
                            <label>Dirección Cliente</label>
                            <input type="text" class="form-control" value="" id="direccionClienteNew" name="direccionClienteNew">
                        </div>

                        <div class="col-md-3">
                            <label>Teléfono Cliente</label>
                            <input type="text" class="form-control" value="" id="telefonoClienteNew" name="telefonoClienteNew">
                        </div>

                        <div class="col-md-3">
                           
                            <label>Unidad/Edificio</label>
                            <input type="text" class="form-control" value="" id="ubicacionClienteNew" name="ubicacionClienteNew">
                        </div>                                                        

                    </div>

                    <br>

                    <div class="row">
                        
                        <div class="col-md-4">
                            <label>Fecha de recogida</label>
                            <input id="fechaHoraRecogidaNew" type="date" class="form-control">
                        </div>
                        
                        <div class="col-md-4">
                            <label>Fecha de entrega</label>
                            <input id="fechaHoraEntregaNew" type="date" class="form-control">
                        </div>
                        
                        <div class="col-md-4">
                            <label>Estado</label>
                            <select class="form-control" id="estadoNew">
                                
                                <option value="En Espera">En Espera</option>
                                <option value="Entregado">Entregado</option>
                                
                            </select>
                        </div>
                    </div>
                    <br>
                    
                    <b>Tipos de servicios</b>
                        <br>
                    <di class="row">
                        
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
                    <div class="col-md-4">
                        <%=rs.getString(2)%>: <input type="checkbox" id="idTipoServicio<%=rs.getString(1)%>" class="tiposServicios" value="<%=rs.getString(1)%>" onclick="push_pop_tipos_servicios(<%=rs.getString(1)%>);">
                    </div>
                    <%}

                            pst.close();
                            rs.close();
                            con.getConnection().close();

                        } catch (Exception e) {
                            System.err.println("Error" + e);
                        }
                    %>


                </di>
                <br>     
                
                <b>Prendas</b>
                <br>
                <di class="row">

                    

                    <%
                        try {
                            Database con = new Database();
                            PreparedStatement pst = null;
                            ResultSet rs = null;
                            //String sql = "Select * from servicio";
                            String sql = "select * from prendas where estado = 'activo'";
                            pst = con.getConnection().prepareStatement(sql);
                            rs = pst.executeQuery();

                            while (rs.next()) {

                    %>
                    <div class="col-md-4">
                        <%=rs.getString(2)%>: <input type="checkbox" id="idPreda<%=rs.getString(1)%>" class="prendas" value="<%=rs.getString(1)%>" onclick="push_pop_prendas(<%=rs.getString(1)%>);">
                    </div>

                    <%}

                            pst.close();
                            rs.close();
                            con.getConnection().close();

                        } catch (Exception e) {
                            System.err.println("Error" + e);
                        }
                    %>

                </di>


                <br>
                <div class="row">
                    <div class="col-md-1">

                        <input type="button" class="btn btn-success" value="Guardar" id="guardarNuevoServicio" onclick="guardarServicio();">

                    </div>
                    <div class="col-md-2">
                        <a href="index.jsp" class="btn btn-success">Cancelar</a>
                    </div>

                </div>
            </form>


        </div>

    </body>
       <footer>
         <jsp:include page="footer.jsp"></jsp:include>
    </footer>
</html>
