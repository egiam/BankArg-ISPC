let btnSend = document.getElementById("btnSend");
let nameSender = document.getElementById("form-name");
let email = document.getElementById("form-email");
let lastName = document.getElementById("form-lastname");
let message = document.getElementById("form-message");

btnSend.addEventListener("click", function() {
    if (
        nameSender.value === "" ||
        email.value === "" ||
        lastName.value === "" ||
        message.value === ""
    ) {
        swal("Error", "Todos los campos son obligatorios", "error", {
            button: "Aceptar",
        });
    } else {
        swal({
            title: "Mensaje enviado",
            text: "El mensaje se ha enviado correctamente, estaremos en contacto con usted",
            icon: "success",
            button: "Aceptar",
        }).then(function() {
            window.location.href = "../index.html";
        });
    }
});

//