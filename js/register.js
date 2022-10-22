// Crear carga de datos de usuario en el formulario de registro

import { users } from './users.js';

let btnRegister = document.getElementById('btnRegister');
let username = document.getElementById('username');
let password = document.getElementById('password');
let password2 = document.getElementById('password2');
let email = document.getElementById('email');
let phone = document.getElementById('phone');
let address = document.getElementById('address');
let identification = document.getElementById('identification');
let name = document.getElementById('name');
let lastName = document.getElementById('lastName');

// Verificar si esta vacio
btnRegister.addEventListener('click', function() {
    if (username.value === '' || password.value === '' || password2.value === '' || email.value === '' || phone.value === '' || address.value === '' || identification.value === '' || name.value === '' || lastName.value === '') {
        alert('Debe completar todos los campos');
    } else {
        // Verificar si el usuario ya existe
        if (users[username.value] === undefined) {
            // Verificar si las contraseñas coinciden
            if (password.value === password2.value) {
                // Agregar usuario
                users[username.value] = password.value;
                
                // Verifica si se guardo el usuario {Solo para devs} TODO: Borrar a posteriori
                console.log(users);

                alert('Usuario registrado con exito');
                window.location.href = './login.html';
            } else {
                alert('Las contraseñas no coinciden');
            }
        } else {
            alert('El usuario ya existe');
        }
    }
});

//