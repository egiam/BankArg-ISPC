import { Component } from '@angular/core';

import Swal from 'sweetalert2';

@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.component.html',
  styleUrls: ['./perfil.component.css'],
})
export class PerfilComponent {
  editarButton() {
    Swal.fire({
      title: 'Editar perfil',
      text: '¿Desea editar su perfil?',
      icon: 'info',
      showConfirmButton: true,
      confirmButtonText: 'Aceptar',
      showCancelButton: true,
      cancelButtonText: 'Cancelar',
    }).then((value) => {
      if (value.isConfirmed) {
        Swal.fire({
          title: 'Ok',
          text: 'Sera redirigido a la pagina para editar perfiles',
          icon: 'success',
          showConfirmButton: true,
          confirmButtonText: 'Aceptar',
        }).then(function () {
          window.location.href = '../personas';
        });
        // Swal.fire({
        //     title: "Error",
        //     text: "Usted no tiene permisos para editar su perfil",
        //     icon: "error",
        //     showConfirmButton:true,
        //     confirmButtonText: 'Aceptar'
        //         });
        //         // window.location.href = "./editarPerfil.html";
      } else if (value.dismiss) {
        Swal.fire({
          title: 'Edición cancelada',
          text: 'La edición del perfil ha sido cancelada',
          icon: 'info',
          showConfirmButton: true,
          confirmButtonText: 'Aceptar',
        });
      }
    });
  }
}
