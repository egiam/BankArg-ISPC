let btnSolicitar = document.getElementById("btnSolicitar");
let monto = document.getElementById("InputMonto");
// let plazo = document.getElementById("plazo");
// let interes = document.getElementById("interes");
let cuota = document.getElementById("InputCuotas");
// let total = document.getElementById("total");

btnSolicitar.addEventListener("click", function() {
    if (monto.value === "" || cuota.value === "") {
        swal("Error", "Todos los campos son obligatorios", "error", {
            button: "Aceptar",
        });
    } else {
        swal({
            title: "Solicitud enviada",
            text: "La solicitud se ha enviado correctamente, estaremos en contacto con usted",
            icon: "success",
            button: "Aceptar",
        }).then(function() {
            window.location.href = "../index.html";
        });
    }
});

//