import { Component } from '@angular/core';
import { ApiService } from 'src/app/servicios/api/api.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-plazo-fijo',
  templateUrl: './plazo-fijo.component.html',
  styleUrls: ['./plazo-fijo.component.css'],
})
export class PlazoFijoComponent {
  constructor(private cuenta: ApiService, private router: Router) {}

  plazo_fijo: any = this.cuenta.getPlazoFijo();
  plazo_fijo_gral: any = this.cuenta.getPlazoFijoGral();
  // doc: any = this.cuenta.getDocumentos();

  // documento(id: number) {
  //   let idDoc = this.cuenta.getDocumentosById(id);
  // }

  nuevoPlazo: any = {};

  // editar
  editarButton(id: number, data: any) {
    // TODO
    this.cuenta.putPlazoFijo(id, data).subscribe(
      (res) => {
        console.log('Plazo Fijo editado correctamente');
        Swal.fire({
          title: 'Editado',
          text: 'Plazo Fijo editado correctamente',
          icon: 'success',
          showConfirmButton: true,
          confirmButtonText: 'Aceptar',
        }).then(() => {
          this.router
            .navigateByUrl('/RefreshComponent', { skipLocationChange: true })
            .then(() => {
              this.router.navigate(['plazoFijo']);
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
      title: 'Eliminar Plazo Fijo',
      text: '¿Desea eliminar a este Plazo Fijo?',
      icon: 'info',
      showConfirmButton: true,
      confirmButtonText: 'Aceptar',
      showCancelButton: true,
      cancelButtonText: 'Cancelar',
    }).then((value) => {
      if (value.isConfirmed) {
        // TODO
        this.cuenta.deletePlazoFijo(id).subscribe(
          (res) => {
            console.log('Plazo Fijo eliminado correctamente');
            Swal.fire({
              title: 'Eliminado',
              text: 'Plazo Fijo eliminado correctamente',
              icon: 'success',
              showConfirmButton: true,
              confirmButtonText: 'Aceptar',
            }).then(() => {
              this.router
                .navigateByUrl('/RefreshComponent', {
                  skipLocationChange: true,
                })
                .then(() => {
                  this.router.navigate(['plazoFijo']);
                });
            });
          },
          (err) => {
            console.log(err);
            Swal.fire({
              title: 'Error',
              text: 'No se pudo eliminar el Plazo Fijo',
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
    this.cuenta.postPlazoFijo(data).subscribe(
      (res) => {
        console.log('Plazo Fijo creado correctamente');
        Swal.fire({
          title: 'Creado',
          text: 'Plazo Fijo creado correctamente',
          icon: 'success',
          showConfirmButton: true,
          confirmButtonText: 'Aceptar',
        }).then(() => {
          this.router
            .navigateByUrl('/RefreshComponent', { skipLocationChange: true })
            .then(() => {
              this.router.navigate(['plazoFijo']);
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
