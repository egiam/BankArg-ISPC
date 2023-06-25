import { Component, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
} from '@angular/forms';
import { Title } from '@angular/platform-browser';
import Swal from 'sweetalert2';
import { Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ApiService } from 'src/app/servicios/api/api.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent implements OnInit {
  form: FormGroup;

  login: any;

  // TODO
  ngOnInit() {
    this.login = {
      email: '',
      password: '',
    };
  }

  constructor(
    private formBuilder: FormBuilder,
    private cuenta: ApiService,
    private router: Router
  ) {
    //Creamos el grupo de controles para el formulario
    this.form = this.formBuilder.group({
      username: ['', [Validators.required]],
      password: ['', [Validators.required]],
    });
  }

  get username() {
    return this.form.get('username');
  }

  get password() {
    return this.form.get('password');
  }

  // users: { [key: string]: string } = {
  //   admin: 'admin',
  //   user: 'user',
  //   guest: 'guest',
  //   Eze: '1234',
  //   Yo: '5678',
  //   'juanPerez@gmail.com': '1234',
  //   'admin@mail.com': '1234',
  // };

  btnLogin = document.getElementById('btnLogin');

  iniciarSesion() {
    let user = this.username?.value;
    let pass = this.password?.value;
    if (user === '' || pass === '') {
      Swal.fire({
        title: 'Error',
        text: 'Debe ingresar usuario y contraseña',
        icon: 'error',
        showConfirmButton: true,
        confirmButtonText: 'Aceptar',
      });
    } else {
      // TODO
      this.cuenta.login(this.login).subscribe(
        (res) => {
          console.log(res);
          Swal.fire({
            title: 'Login exitoso',
            text: 'El usuario se ha logueado correctamente',
            icon: 'success',
            showConfirmButton: true,
            confirmButtonText: 'Aceptar',
          }).then(() => {
            this.router.navigate(['']);
            // window.location.href = '../body/home';
          });
        },
        (err) => {
          console.log(err);
          Swal.fire({
            title: 'Error',
            text: 'El usuario o contraseña son incorrectos',
            icon: 'error',
            showConfirmButton: true,
            confirmButtonText: 'Aceptar',
          });
        }
      );
      // if (this.users[user] === pass) {

      //   Swal.fire({
      //     title: 'Login exitoso',
      //     text: 'El usuario se ha logueado correctamente',
      //     icon: 'success',
      //     showConfirmButton: true,
      //     confirmButtonText: 'Aceptar',
      //   }).then(function () {
      //     window.location.href = '../index.html';
      //   });
      // } else {
      //   Swal.fire({
      //     title: 'Error',
      //     text: 'El usuario o contraseña son incorrectos',
      //     icon: 'error',
      //     showConfirmButton: true,
      //     confirmButtonText: 'Aceptar',
      //   });
      // }
    }
  }
}
