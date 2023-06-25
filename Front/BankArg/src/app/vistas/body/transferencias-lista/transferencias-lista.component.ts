import { Component } from '@angular/core';
import { ApiService } from 'src/app/servicios/api/api.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-transferencias-lista',
  templateUrl: './transferencias-lista.component.html',
  styleUrls: ['./transferencias-lista.component.css'],
})
export class TransferenciasListaComponent {
  constructor(private cuenta: ApiService, private router: Router) {}

  transferencias: any = this.cuenta.getTransferencias();
  transferenciasGral: any = this.cuenta.getTransferenciasGral();

  nuevaTransferencia: any = {};

  // editar
  editarButton(id: number, data: any) {
    // TODO
    this.cuenta.putTransferencias(id, data).subscribe(
      (res) => {
        console.log('Transferencia editada correctamente');
        Swal.fire({
          title: 'Editado',
          text: 'Transferencia editada correctamente',
          icon: 'success',
          showConfirmButton: true,
          confirmButtonText: 'Aceptar',
        }).then(() => {
          this.router
            .navigateByUrl('/RefreshComponent', { skipLocationChange: true })
            .then(() => {
              this.router.navigate(['transferenciasLista']);
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
      title: '¿Estás seguro?',
      text: 'No podrás revertir esta acción',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Sí, eliminar',
      cancelButtonText: 'Cancelar',
    }).then((result) => {
      if (result.value) {
        this.cuenta.deleteTransferencias(id).subscribe(
          (res) => {
            console.log('Transferencia eliminada correctamente');
            Swal.fire({
              title: 'Eliminado',
              text: 'Transferencia eliminada correctamente',
              icon: 'success',
              showConfirmButton: true,
              confirmButtonText: 'Aceptar',
            }).then(() => {
              this.router
                .navigateByUrl('/RefreshComponent', {
                  skipLocationChange: true,
                })
                .then(() => {
                  this.router.navigate(['transferenciasLista']);
                });
            });
          },
          (err) => {
            console.log(err);
            Swal.fire({
              title: 'Error',
              text: 'No se pudo eliminar la transferencia',
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
    this.cuenta.postTransferencias(data).subscribe(
      (res) => {
        console.log('Transferencia creada correctamente');
        Swal.fire({
          title: 'Creado',
          text: 'Transferencia creada correctamente',
          icon: 'success',
          showConfirmButton: true,
          confirmButtonText: 'Aceptar',
        }).then(() => {
          this.router
            .navigateByUrl('/RefreshComponent', { skipLocationChange: true })
            .then(() => {
              this.router.navigate(['transferenciasLista']);
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
