let btnEditar = document.getElementById("btnEditar");

btnEditar.addEventListener("click", function() {
    swal({
        title: "Editar perfil",
        text: "¿Desea editar su perfil?",
        icon: "info",
        buttons: ["Cancelar", "Aceptar"],
    }).then(function(value) {
        if (value) {
            swal({
                title: "Error",
                text: "Usted no tiene permisos para editar su perfil",
                icon: "error",
                button: "Aceptar",
            });
            // window.location.href = "./editarPerfil.html";
        } else {
            swal({
                title: "Edición cancelada",
                text: "La edición del perfil ha sido cancelada",
                icon: "info",
                button: "Aceptar",
            });
        }
    });
});

//