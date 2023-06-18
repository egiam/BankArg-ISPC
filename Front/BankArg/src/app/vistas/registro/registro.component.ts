import { Component, OnInit } from '@angular/core';
import Swal from 'sweetalert2';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ApiService } from 'src/app/servicios/api/api.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css'],
})
export class RegistroComponent implements OnInit {
  constructor(
    private formBuilder: FormBuilder,
    private cuenta: ApiService,
    private router: Router
  ) {
    this.form = this.formBuilder.group({
      username: ['', [Validators.required]],
      password: ['', [Validators.required, Validators.minLength(8)]],
      // password2:["",[Validators.required], Validators.minLength(8)],
      email: ['', [Validators.required, Validators.email]],
      // telefono:["",[Validators.required]],
      // domicilio:["",[Validators.required]],
      // dni:["",[Validators.required]],
      // nombre:["",[Validators.required]],
      // apellido:["",[Validators.required]],
    });
  }

  register: any;

  // TODO:
  ngOnInit() {
    this.register = {
      username: '',
      password: '',
      email: '',
    };
  }

  form: FormGroup;

  users: { [key: string]: string } = {
    admin: 'admin',
    user: 'user',
    guest: 'guest',
    Eze: '1234',
    Yo: '5678',
  };

  get username() {
    return this.form.get('username');
  }
  get password() {
    return this.form.get('password');
  }
  // get password2(){
  //   return this.form.get("password2")
  // }
  get email() {
    return this.form.get('email');
  }
  // get telefono(){
  //   return this.form.get("telefono")
  // }
  // get domicilio(){
  //   return this.form.get("domicilio")
  // }
  // get dni(){
  //   return this.form.get("dni")
  // }
  // get nombre(){
  //   return this.form.get("nombre")
  // }
  // get apellido(){
  //   return this.form.get("apellido")
  // }

  public Registrar() {
    let usernameV = this.username?.value;
    let passwordV = this.password?.value;
    // let password2V = this.password2?.value
    let emailV = this.email?.value;
    // let telefonoV = this.telefono?.value
    // let domicilioV = this.domicilio?.value
    // let nombreV = this.nombre?.value
    // let apellidoV = this.apellido?.value
    // let dniV = this.dni?.value

    // console.log(usernameV,passwordV,password2V,emailV,telefonoV,domicilioV,nombreV,apellidoV)
    console.log(usernameV, passwordV, emailV);
    if (
      usernameV === '' ||
      passwordV === '' ||
      // password2V === "" ||
      emailV === ''
      // telefonoV === "" ||
      // domicilioV === "" ||
      // dniV === "" ||
      // nombreV === "" ||
      // apellidoV === ""
    ) {
      Swal.fire({
        title: 'Error',
        text: 'Todos los campos son obligatorios',
        icon: 'error',
        showConfirmButton: true,
        confirmButtonText: 'Aceptar',
      });
      // alert("Debe completar todos los campos");
    } else {
      // Verificar si el usuario ya existe
      if (this.users[usernameV] === undefined) {
        // Verificar si las contraseñas coinciden
        // if (passwordV === password2V) {
        if (passwordV === passwordV) {
          // Validar email
          if (true) {
            // Agregar usuario
            this.users[usernameV] = passwordV;

            // TODO:
            this.cuenta.register(this.register).subscribe(
              (res) => {
                console.log(res);
              },
              (err) => {
                console.log(err);
              }
            );

            Swal.fire({
              title: 'Registro exitoso',
              text:
                'El usuario ' +
                this.register.username +
                ' se ha registrado correctamente',
              icon: 'success',
              showConfirmButton: true,
              confirmButtonText: 'Aceptar',
            }).then(() => {
              this.router.navigate(['']);
              // window.location.href = './login.html';
            });
          } else {
            Swal.fire({
              title: 'Error',
              text: 'El email no es valido',
              icon: 'error',
              showConfirmButton: true,
              confirmButtonText: 'Aceptar',
            });
          }
        } else {
          Swal.fire({
            title: 'Error',
            text: 'Las contraseñas no coinciden',
            icon: 'error',
            showConfirmButton: true,
            confirmButtonText: 'Aceptar',
          });
          // alert("Las contraseñas no coinciden");
        }
      } else {
        Swal.fire({
          title: 'Error',
          text: 'El usuario ya existe',
          icon: 'error',
          showConfirmButton: true,
          confirmButtonText: 'Aceptar',
        });
        // alert("El usuario ya existe");
      }
    }
  }
}
