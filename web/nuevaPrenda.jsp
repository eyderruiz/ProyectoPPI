<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva Prenda</title>
        <jsp:include page="head.jsp"></jsp:include>
            <script src="boostrap/js/prendas.js" type="text/javascript"></script>
            <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        </head>
        <body>
        <jsp:include page="header.jsp"></jsp:include>
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <div class="container">
                <h3>Nueva Prenda</h3>
                <br> 

            <form action="" method="post" id="formNuevaPrenda">
                <div class="row">

                    <div class="col-md-5">
                        <label>Prenda</label>
    
                        <input type="text" class="form-control" value="" id="nombrePrendaNew" name="nombrePrendaNew">
                    </div>                                    

                </div>
                <br>

                <div class="row">

                    <div class="col-md-1">

                        <input type="button" class="btn btn-success" value="Guardar" id="guardarNuevaPrenda">

                    </div>
                    <div class="col-md-2">
                        <a href="prendas.jsp" class="btn btn-success">Cancelar</a>
                    </div>

                </div>
            </form>

            
        </div>

    </body>
</html>
