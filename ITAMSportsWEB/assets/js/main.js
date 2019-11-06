//const Swal = require('sweetalert2')
const swalMaterialize = Swal.mixin({
    customClass: {
        confirmButton: 'waves-effect waves-light btn primary-bgColor-1',
        cancelButton: 'waves-effect waves-light btn red',
        popup: 'animated tada'
    },
    buttonsStyling: false
})

function alerta(tipo, message) {
    elTipo = ""
    if (tipo == "error")
        elTipo = "error"
    else if (tipo == "informativo")
        elTipo = "info"
    else if (tipo == "exito")
        elTipo = "succes"
    else if (tipo == "precaucion")
        elTipo = "warning"
    else if (tipo == "pregunta")
        elTipo = "question"

    swalMaterialize.fire({
        type: elTipo,
        text: message,
        animation: false
    })
}

//Cuando el documento esté cargado, algo así como mi main
$(document).ready(function () {
    $('.sidenav').sidenav();
    $('.parallax').parallax();
    $('select').formSelect();
});

$('input.select-dropdown').on('change', function () {
    console.log($(this).val())
    document.getElementById('<%=HiddenField1.ClientID%>').value = $(this).val()
});