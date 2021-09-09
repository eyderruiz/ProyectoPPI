/* global arrayPrendas, arrayIdTipoServicios, toastr */
$(document).ready(function () {

});
arrayIdTipoServicios = [];
arrayPrendas = [];


function push_pop_tipos_servicios(i) {

    if ($("#idTipoServicio" + i).prop("checked")) {
        arrayIdTipoServicios.push($("#idTipoServicio" + i).val());
    } else {
        sacarIdTipoServicioArray(arrayIdTipoServicios, $("#idTipoServicio" + i).val());
    }
}


function sacarIdTipoServicioArray(array, item) {

    arrayIdTipoServicios = [];
    for (var i = 0; i < array.length; i++) {
        if (array[i] !== item) {
            arrayIdTipoServicios.push(array[i]);
        }
    }
    console.log(arrayIdTipoServicios);
}


function push_pop_prendas(i) {

    if ($("#idPreda" + i).prop("checked")) {
        arrayPrendas.push($("#idPreda" + i).val());
    } else {
        sacarIdPrendaArray(arrayPrendas, $("#idPreda" + i).val());
    }
}


function sacarIdPrendaArray(array, item) {

    arrayPrendas = [];
    for (var i = 0; i < array.length; i++) {
        if (array[i] !== item) {
            arrayPrendas.push(array[i]);
        }
    }
    //console.log(arrayPrendas);
}

function guardarServicio() {
    $.post('operacionesCrud?opcion=nuevoServicio', {
        nombreCliente: $("#nombreClienteNew").val(),
        direccionCliente: $("#direccionClienteNew").val(),
        telefonoCliente: $("#telefonoClienteNew").val(),
        ubicacionCliente: $("#ubicacionClienteNew").val(),
        fechaHoraRecogida: $("#fechaHoraRecogidaNew").val(),
        fechaHoraEntrega: $("#fechaHoraEntregaNew").val(),
        estado: $("#estadoNew").val(),
        "idTipoServicio[]": arrayIdTipoServicios,
        "idPrendas[]": arrayPrendas

    }, function (responseText) {
        if (responseText != "true") {
            if (responseText[0] == "t") {
                toastr.success("Orden de Servicio Creada");
                setTimeout("location.href='index.jsp'", 1000);

            } else {
                toastr.error("No se puede crear la Orden de Servicio");
                setTimeout('document.location.reload()', 1000);
            }
        } else {
            toastr.error("Error Interno");
            location.reload();
        }
    });
}




// Editar

function push_pop_tipos_servicios_edit(i) {

    if ($("#idTipoServicioEdit" + i).prop("checked")) {
        arrayIdTipoServicios.push($("#idTipoServicioEdit" + i).val());
    } else {
        sacarIdTipoServicioArray(arrayIdTipoServicios, $("#idTipoServicioEdit" + i).val());
    }
}


function push_pop_prendas_edit(i) {

    if ($("#idPredaEdit" + i).prop("checked")) {
        arrayPrendas.push($("#idPredaEdit" + i).val());
    } else {
        sacarIdPrendaArray(arrayPrendas, $("#idPredaEdit" + i).val());
    }
}

function guardarServicioEdit() {
    //alert(arrayPrendas);
    $.post('operacionesCrud?opcion=editarServicio', {
        nombreCliente: $("#nombreClienteEdit").val(),
        direccionCliente: $("#direccionClienteEdit").val(),
        telefonoCliente: $("#telefonoClienteEdit").val(),
        ubicacionCliente: $("#ubicacionClienteEdit").val(),
        fechaHoraRecogida: $("#fechaHoraRecogidaEdit").val(),
        fechaHoraEntrega: $("#fechaHoraEntregaEdit").val(),
        id: $("#idDomicilioEdit").val(),
        estado: $("#estadoEdit").val(),
        "idTipoServicio[]": arrayIdTipoServicios,
        "idPrendas[]": arrayPrendas

    }, function (responseText) {
        if (responseText != "true") {
            if (responseText[0] == "t") {
                toastr.success("Orden de servicio Editada");
                setTimeout("location.href='index.jsp'", 1000);

            } else {
                toastr.error("No se puede editar la orden de servicio");
                setTimeout('document.location.reload()', 1000);
            }
        } else {
            toastr.error("Error Interno");
            location.reload();
        }
    });
}

function eliminarServicio(id){
     var resul = confirm('¿Esta seguro que desea eliminar la Orden de Servicio?');
    if (resul === true) {

        $.post('operacionesCrud?opcion=eliminarServicio', {
            id: id
        }, function (responseText) {
            if (responseText != "true") {
                if (responseText[0] == "t") {
                    toastr.success("Orden Servicio eliminada");
                    setTimeout('document.location.reload()', 1000);

                } else {
                    toastr.error("No se puede eliminar la Orden de Servicio");
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


