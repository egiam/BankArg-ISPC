// Crear validacion de login

import { users } from './users.js';

let btnLogin = document.getElementById('btnLogin');
let username = document.getElementById('username');
let password = document.getElementById('password');

// Para forma 1
// let usernames = ['admin', 'user', 'guest'];
// let passwords = ['admin', 'user', 'guest', '1234', '5678', '9012'];

// Diccionario con los usuarios y contraseñas
// let users = {
//     'admin': 'admin',
//     'user': 'user',
//     'guest': 'guest',
//     'Eze': '1234',
//     'Yo': '5678'
// }

btnLogin.addEventListener('click', function() {
    // Forma 0
    let user = username.value;
    let pass = password.value;
    if (user === '' || pass === '') {
        alert('Debe ingresar usuario y contraseña', 'error');
    } else {
        if (users[user] === pass) {
            alert(`A logrado ingresar con exito a su cuenta, Bienvenido ${username.value}`);
            window.location.href = './home banking.html';
        } else {
            alert('Usuario o contraseña incorrectos');
        } 
    }

    // Forma 1
    // if (usernames.includes(username.value) && passwords.includes(password.value)) {
    //     alert(`A logrado ingresar con exito a su cuenta, Bienvenido ${username.value}`);
    //     window.location.href = './home banking.html';
    // } else {
    //     alert('Usuario o contraseña incorrectos');
    // }

    // Forma 2
    // if (username.value == 'admin' && password.value == 'admin') {
    //     alert(`A logrado ingresar con exito a su cuenta, Bienvenido ${username.value}`);
    //     window.location.href = './home banking.html';
    // } else {
    //     alert('Usuario o contraseña incorrectos');
    // }
});

//