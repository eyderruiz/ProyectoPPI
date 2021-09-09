<%@page import="java.sql.*"%>
<%@page import="Modelo.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Domicilio</title>
        <jsp:include page="head.jsp"></jsp:include>
            <script src="boostrap/js/servicios.js" type="text/javascript"></script>
            <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        </head>
        <body>
        <jsp:include page="header.jsp"></jsp:include>
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <div class="container">
                <h3>Editar Domicilio</h3>
                <br> 

                <form action="" method="post" id="formNuevoServicio">
                <%

                    try {
                        Database con1 = new Database();
                        PreparedStatement pst1 = null;
                        ResultSet rs1 = null;

                        int id = Integer.parseInt(request.getParameter("id"));

                        String sql1 = "select * from domicilios where id_domicilio = ?";
                        pst1 = con1.getConnection().prepareStatement(sql1);
                        pst1.setInt(1, id);
                        rs1 = pst1.executeQuery();

                        while (rs1.next()) {
                %>
                <div class="row">
                    <div class="col-md-3">
                        <label>Nombre Cliente</label>
                        <input type="hidden" id="idDomicilioEdit" value="<%=rs1.getString(1)%>">
                        <input type="text" class="form-control" value="<%=rs1.getString(2)%>" id="nombreClienteEdit" name="nombreClienteNew">
                    </div>


                    <div class="col-md-3">
                        <label>Dirección Cliente</label>
                        <input type="text" class="form-control" value="<%=rs1.getString(3)%>" id="direccionClienteEdit" name="direccionClienteNew">
                    </div>

                    <div class="col-md-3">
                        <label>Teléfono Cliente</label>
                        <input type="text" class="form-control" value="<%=rs1.getString(4)%>" id="telefonoClienteEdit" name="telefonoClienteNew">
                    </div>

                    <div class="col-md-3">

                        <label>Unidad/Edificio</label>
                        <input type="text" class="form-control" value="<%=rs1.getString(5)%>" id="ubicacionClienteEdit" name="ubicacionClienteNew">
                    </div>                                                        

                </div>

                <br>

                <div class="row">

                    <div class="col-md-4">
                        <label>Fecha de recogida</label>
                        <input id="fechaHoraRecogidaEdit" type="date" class="form-control" value="<%=rs1.getDate(7)%>">
                    </div>

                    <div class="col-md-4">
                        <label>Fecha de entrega</label>
                        <input id="fechaHoraEntregaEdit" type="date" class="form-control"  value="<%=rs1.getDate(6)%>">
                    </div>

                    <div class="col-md-4">
                        <label>Estado</label>
                        <select class="form-control" id="estadoEdit">

                            <option value="En espera">En Espera</option>
                            <option value="Entregado">Entregado</option>

                        </select>
                    </div>
                </div>
                <%
                        }
                        pst1.close();
                        rs1.close();
                        con1.getConnection().close();
                    } catch (Exception e) {
                        System.err.println("Error" + e);
                    }
                %>
                <br>

                <b>Tipos de servicios</b>
                <br>
                <b>Nota</b>
                <br>
                <p>
                    <em>
                        Los siguientes servicios son los elegidos anteriormente, si desea cambiarlos o agregar uno mas, debe volver a seleccionarlos y seleccionar el nuevo servicio tambien.
                    </em>
                    <br>
                    <em>
                        Si no selecciona ningun servicio el domicilio quedara con los seleccionados al momento de crearlo
                    </em>

                </p>
                <di class="row">
                    <%
                        try {
                            Database conS = new Database();
                            PreparedStatement pstS = null;
                            ResultSet rsS = null;
                            int id = Integer.parseInt(request.getParameter("id"));
                            String sqlS = "select ts.nombre  from domicilios dm join servicios_domicilio sd on dm.id_domicilio = sd.id_domicilio join tipo_servicios ts on ts.id_servicio = sd.id_tipo_servicio  where dm.id_domicilio = ?";
                            pstS = conS.getConnection().prepareStatement(sqlS);
                            pstS.setInt(1, id);
                            rsS = pstS.executeQuery();

                            while (rsS.next()) {
                    %>
                    <p>
                        <em>
                            (<%=rsS.getString(1)%>)
                        </em>
                    </p>

                    <%}

                            pstS.close();
                            rsS.close();
                            conS.getConnection().close();

                        } catch (Exception e) {
                            System.err.println("Error" + e);
                        }
                    %>

                </di>
                
                <di class="row">
                    <%
                        try {
                            Database con = new Database();
                            PreparedStatement pst = null;
                            ResultSet rs = null;
                            //String sql = "Select * from servicio";
                            String sql = "select * from tipo_servicios where estado = 'activo'";
                            pst = con.getConnection().prepareStatement(sql);
                            rs = pst.executeQuery();

                            while (rs.next()) {

                    %>

                    <div class="col-md-4">
                        <%=rs.getString(2)%>: <input type="checkbox" id="idTipoServicioEdit<%=rs.getString(1)%>" class="tiposServicios" value="<%=rs.getString(1)%>" onclick="push_pop_tipos_servicios_edit(<%=rs.getString(1)%>);">
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
                <b>Nota</b>
                <br>
                <p>
                    <em>
                        Los siguientes prendas son las elegidas anteriormente, si desea cambiarlas o agregar una mas, debe volver a seleccionarlas y seleccionar la nueva prenda tambien.
                    </em>
                    <br>
                    <em>
                        Si no selecciona ninguna prenda el domicilio quedara con las seleccionados al momento de crearlo
                    </em>

                </p>
                <di class="row">
                    <%
                        try {
                            Database conS = new Database();
                            PreparedStatement pstS = null;
                            ResultSet rsS = null;
                            int id = Integer.parseInt(request.getParameter("id"));
                            String sqlS = "select pr.nombre  from domicilios dm join prendas_domicilio pd on dm.id_domicilio = pd.id_domicilio join prendas pr on pr.id_prenda = pd.id_prenda  where dm.id_domicilio = ?";
                            pstS = conS.getConnection().prepareStatement(sqlS);
                            pstS.setInt(1, id);
                            rsS = pstS.executeQuery();

                            while (rsS.next()) {
                    %>
                    <p>
                        <em>
                            (<%=rsS.getString(1)%>)
                        </em>
                    </p>

                    <%}

                            pstS.close();
                            rsS.close();
                            conS.getConnection().close();

                        } catch (Exception e) {
                            System.err.println("Error" + e);
                        }
                    %>

                </di>
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
                        <%=rs.getString(2)%>: <input type="checkbox" id="idPredaEdit<%=rs.getString(1)%>" class="prendas" value="<%=rs.getString(1)%>" onclick="push_pop_prendas_edit(<%=rs.getString(1)%>);">
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

                        <input type="button" href="index.jsp" class="btn btn-success" value="Guardar" id="guardarEditarServicio" onclick="guardarServicioEdit();">

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

