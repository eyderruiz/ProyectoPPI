/* global toastr */
$(document).ready(function(){
    $("#guardarEditarTipoServicio").click(function () {
        if ($("#nombreTipoServicioEdit").val() === "") {

            $("#nombreTipoServicioEdit").css('background', 'red');
            alert("Los Campos pintados de rojo son obligatorios");

            return false;
        } else {
            $.post('operacionesCrud?opcion=editarTipoServicio', {
                nombre: $("#nombreTipoServicioEdit").val(),
                id: $("#idTipoServicioEdit").val()
            }, function (responseText) {
                if (responseText != "true") {
                    if (responseText[0] == "t") {
                        toastr.success("Tipo de servicio editado");
                        setTimeout("location.href='tipoServicios.jsp'", 1000);

                    } else {
                        toastr.error("No se puede editar el tipo de servicio");
                        setTimeout('document.location.reload()', 1000);
                    }
                } else {
                    toastr.error("Error Interno");
                    location.reload();
                }
            });

        }
    });
    
    $("#guardarNuevaTipoServicio").click(function () {
        if ($("#nombreTipoServicioNew").val() === "") {

            $("#nombreTipoServicioNew").css('background', 'red');
            alert("Los Campos pintados de rojo son obligatorios");

            return false;
        } else {
            $.post('operacionesCrud?opcion=nuevaTipoServicio', {
                nombre: $("#nombreTipoServicioNew").val()
            }, function (responseText) {
                if (responseText != "true") {
                    if (responseText[0] == "t") {
                        toastr.success("Tipo de servicio creado");
                        setTimeout("location.href='tipoServicios.jsp'", 1000);

                    } else {
                        toastr.error("No se puede crear el tipo de servicio");
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


function eliminarTipoServicio(id) {

    var resul = confirm('¿Esta seguro que desea eliminar el tipo de servicio?');
    if (resul === true) {

        $.post('operacionesCrud?opcion=eliminarTipoServicio', {
            id: id
        }, function (responseText) {
            if (responseText != "true") {
                if (responseText[0] == "t") {
                    toastr.success("Tipo de servicio eliminado");
                    setTimeout('document.location.reload()', 1000);

                } else {
                    toastr.error("No se puede eliminar el tipo de servicio");
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


