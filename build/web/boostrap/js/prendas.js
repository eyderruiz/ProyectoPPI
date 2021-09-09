/* global toastr */
$(document).ready(function(){
    $("#guardarEditarPrenda").click(function () {
        if ($("#nombrePrendaEdit").val() === "") {

            $("#nombrePrendaEdit").css('background', 'red');
            alert("Los Campos pintados de rojo son obligatorios");

            return false;
        } else {
            $.post('operacionesCrud?opcion=editarPrenda', {
                nombrePrenda: $("#nombrePrendaEdit").val(),
                idPrenda: $("#idPrendaEdit").val()
            }, function (responseText) {
                if (responseText != "true") {
                    if (responseText[0] == "t") {
                        toastr.success("Prenda editada");
                        setTimeout("location.href='prendas.jsp'", 1000);

                    } else {
                        toastr.error("No se puede editar la prenda");
                        setTimeout('document.location.reload()', 1000);
                    }
                } else {
                    toastr.error("Error Interno");
                    location.reload();
                }
            });

        }
    });
    
    $("#guardarNuevaPrenda").click(function () {
        if ($("#nombrePrendaNew").val() === "") {

            $("#nombrePrendaNew").css('background', 'red');
            alert("Los Campos pintados de rojo son obligatorios");

            return false;
        } else {
            $.post('operacionesCrud?opcion=nuevaPrenda', {
                nombrePrenda: $("#nombrePrendaNew").val()
            }, function (responseText) {
                if (responseText != "true") {
                    if (responseText[0] == "t") {
                        toastr.success("Prenda Creada");
                        setTimeout("location.href='prendas.jsp'", 1000);

                    } else {
                        toastr.error("No se puede crear la prenda");
                        setTimeout('document.location.reload()', 1000);
                    }
                } else {
                    toastr.error("Error Interno");
                    location.reload();
                }
            });

        }
    });
});


function eliminarPrenda(idPrenda) {

    var resul = confirm('¿Esta seguro que desea eliminar la prenda?');
    if (resul === true) {

        $.post('operacionesCrud?opcion=eliminarPrenda', {
            idPrenda: idPrenda
        }, function (responseText) {
            if (responseText != "true") {
                if (responseText[0] == "t") {
                    toastr.success("Prenda eliminada");
                    setTimeout('document.location.reload()', 1000);

                } else {
                    toastr.error("No se puede eliminar la prenda");
                }
            } else {
                toastr.error("Error Interno");
                location.reload();
            }
        });
    } else {

        return false;
    }
}


