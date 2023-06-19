import { Component } from '@angular/core';
import { ApiService } from 'src/app/servicios/api/api.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-personas',
  templateUrl: './personas.component.html',
  styleUrls: ['./personas.component.css'],
})
export class PersonasComponent {
  constructor(private cuenta: ApiService, private router: Router) {}

  personas: any = this.cuenta.getPersonas();
  personasGral: any = this.cuenta.getPersonasGral();
  // doc: any = this.cuenta.getDocumentos();

  // documento(id: number) {
  //   let idDoc = this.cuenta.getDocumentosById(id);
  // }

  nuevaPersona: any = {};

  // editar
  editarButton(id: number, data: any) {
    // TODO
    this.cuenta.putPersonas(id, data).subscribe(
      (res) => {
        console.log('Persona editada correctamente');
        Swal.fire({
          title: 'Editado',
          text: 'Persona editada correctamente',
          icon: 'success',
          showConfirmButton: true,
          confirmButtonText: 'Aceptar',
        }).then(() => {
          this.router
            .navigateByUrl('/RefreshComponent', { skipLocationChange: true })
            .then(() => {
              this.router.navigate(['personas']);
            });
        });
      },
      (err) => {
        console.log(err);
        Swal.fire({
          title: 'Error',
          text: 'Datos insuficientes o Incorrectos',
          icon: 'error',
          showConfirmButton: true,
          confirmButtonText: 'Aceptar',
        });
      }
    );
  }

  // eliminar
  eliminarButton(id: number) {
    console.log(id);
    Swal.fire({
      title: 'Eliminar Persona',
      text: '¿Desea eliminar a esta Persona?',
      icon: 'info',
      showConfirmButton: true,
      confirmButtonText: 'Aceptar',
      showCancelButton: true,
      cancelButtonText: 'Cancelar',
    }).then((value) => {
      if (value.isConfirmed) {
        // TODO
        this.cuenta.deletePersonas(id).subscribe(
          (res) => {
            console.log('Persona eliminada correctamente');
            Swal.fire({
              title: 'Eliminado',
              text: 'Persona eliminada correctamente',
              icon: 'success',
              showConfirmButton: true,
              confirmButtonText: 'Aceptar',
            }).then(() => {
              this.router
                .navigateByUrl('/RefreshComponent', {
                  skipLocationChange: true,
                })
                .then(() => {
                  this.router.navigate(['personas']);
                });
            });
          },
          (err) => {
            console.log(err);
            Swal.fire({
              title: 'Error',
              text: 'No se pudo eliminar la persona',
              icon: 'error',
              showConfirmButton: true,
              confirmButtonText: 'Aceptar',
            });
          }
        );
      }
    });
  }

  // crear
  crearButton(data: any) {
    console.log(data);
    // TODO
    this.cuenta.postPersonas(data).subscribe(
      (res) => {
        console.log('Persona creada correctamente');
        Swal.fire({
          title: 'Creado',
          text: 'Persona creada correctamente',
          icon: 'success',
          showConfirmButton: true,
          confirmButtonText: 'Aceptar',
        }).then(() => {
          this.router
            .navigateByUrl('/RefreshComponent', { skipLocationChange: true })
            .then(() => {
              this.router.navigate(['personas']);
            });
        });
      },
      (err) => {
        console.log(err);
        Swal.fire({
          title: 'Error',
          text: 'Datos insuficientes o Incorrectos',
          icon: 'error',
          showConfirmButton: true,
          confirmButtonText: 'Aceptar',
        });
      }
    );
  }
}
