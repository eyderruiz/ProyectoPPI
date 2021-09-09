<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo tipo de servicio</title>
        <jsp:include page="head.jsp"></jsp:include>
            <script src="boostrap/js/tipoServicios.js" type="text/javascript"></script>
            <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        </head>
        <body>
        <jsp:include page="header.jsp"></jsp:include>
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <div class="container">
                <h3>Nuevo tipo de servicio</h3>
                <br> 

            <form action="" method="post" id="formNuevoTipoServicio">
                <div class="row">

                    <div class="col-md-5">
                        <label>Servicio</label>
    
                        <input type="text" class="form-control" value="" id="nombreTipoServicioNew" name="nombreTipoServicioNew">
                    </div>                                    

                </div>
                <br>

                <div class="row">

                    <div class="col-md-1">

                        <input type="button" class="btn btn-success" value="Guardar" id="guardarNuevaTipoServicio">

                    </div>
                    <div class="col-md-2">
                        <a href="tipoServicios.jsp" class="btn btn-success">Cancelar</a>
                    </div>

                </div>
            </form>

            
        </div>

    </body>

</html>
