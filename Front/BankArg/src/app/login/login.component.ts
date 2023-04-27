import { Component } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule } from '@angular/forms';
import { Title } from '@angular/platform-browser';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  public iniciarSesion() {}
  //   constructor(private formBuilder : FormBuilder){}
  //   form = this.formBuilder.group({
  //     username:[""],
  //     password:[""]
  //   })
  //   users = {
  //     'admin': 'admin',
  //     'user': 'user',
  //     'guest': 'guest',
  //     'Eze': '1234',
  //     'Yo': '5678'
  // }
  //   btnLogin = document.getElementById("btnLogin");
  //   iniciarSesion(){
  //     let user = this.username;
  //     let pass = this.password;
  //     if (user === "" || pass === "") {
  //         Swal.fire({
  //           title:"Error",
  //           text: "Debe ingresar usuario y contraseña",
  //           icon: "error",
  //           showConfirmButton:true,
  //           confirmButtonText:'Aceptar'
  //     });
  //     } else {
  //         if (this.users[user] === pass) {
  //             Swal.fire({
  //                 title: "Login exitoso",
  //                 text: "El usuario se ha logueado correctamente",
  //                 icon: "success",
  //                 showConfirmButton:true,
  //                 confirmButtonText:'Aceptar'
  //             }).then(function() {
  //                 window.location.href = "../index.html";
  //             });
  //         } else {
  //             Swal.fire({
  //                 title: "Error",
  //                 text: "El usuario o contraseña son incorrectos",
  //                 icon: "error",
  //                 showConfirmButton:true,
  //                 confirmButtonText:'Aceptar'
  //             });
  //         }
  //     }
  // };
}
