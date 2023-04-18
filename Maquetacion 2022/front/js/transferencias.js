let btnTransferir = document.getElementById("btnTransferir");
let btnAgregarCont = document.getElementById("btnAgregarCont");
let btnHistorial = document.getElementById("btnHistorial");

btnTransferir.addEventListener("click", function() {
    swal({
        title: "Error",
        text: "Usted no tiene permisos para transferir",
        icon: "error",
        button: "Aceptar",
    });
});

btnAgregarCont.addEventListener("click", function() {
    swal({
        title: "Error",
        text: "Usted no tiene permisos para agregar contactos",
        icon: "error",
        button: "Aceptar",
    });
});

btnHistorial.addEventListener("click", function() {
    swal({
        title: "Error",
        text: "Usted no tiene permisos para ver el historial",
        icon: "error",
        button: "Aceptar",
    });
});

//