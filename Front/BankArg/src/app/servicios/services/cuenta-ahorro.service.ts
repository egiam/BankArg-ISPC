import { Injectable } from '@angular/core';
import { Persona } from 'src/app/modelos/persona';
import Swal from 'sweetalert2';

@Injectable({
  providedIn: 'root',
})
export class CuentaAhorroService {
  depositar(cantidad: number, persona: Persona): void {
    persona.saldo += cantidad;
    Swal.fire({
      title: 'Saldo Actual:',
      showConfirmButton: true,
      confirmButtonText: 'aceptar',
      text: '$ ' + persona.saldo,
    });
  }

  retirar(cantidad: number, persona: Persona): void {
    if (cantidad <= persona.saldo) {
      persona.saldo -= cantidad;
      Swal.fire({
        title: 'Saldo Actual:',
        showConfirmButton: true,
        confirmButtonText: 'aceptar',
        text: '$ ' + persona.saldo,
      });
    } else {
      Swal.fire({
        title: 'Saldo Insuficiente',
        icon: 'error',
        showConfirmButton: true,
        confirmButtonText: 'aceptar',
      });
    }
  }
}
