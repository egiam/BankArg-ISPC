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
        if (validateEmail(email.value)) {
            swal({
                title: "Mensaje enviado",
                text: "El mensaje se ha enviado correctamente, estaremos en contacto con usted",
                icon: "success",
                button: "Aceptar",
            }).then(function() {
                fetchEmail();
                window.location.href = "../index.html";
            });
        } else {
            swal("Error", "El email no es valido", "error", {
                button: "Aceptar",
            });
        }
    }
});

// Funcion para validar email
function validateEmail(email) {
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
}

// Fetch email API from https://formsubmit.co/ and send email to me when someone send a message
fetchEmail = () => {
    fetch("https://formsubmit.co/BankArgISPC@gmail.com", {
        method: "POST",
        body: JSON.stringify({
            name: nameSender.value,
            email: email.value,
            lastName: lastName.value,
            message: message.value,
        }),
        headers: {
            "Content-Type": "application/json",
        },
    });
};

//