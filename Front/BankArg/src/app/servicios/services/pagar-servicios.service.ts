import { Injectable } from '@angular/core';
import { Persona } from 'src/app/modelos/persona';
import Swal from 'sweetalert2';

@Injectable({
  providedIn: 'root'
})
export class PagarServiciosService {

  constructor() { }

  cuentaAgua:number= 1878;

  cuentaGas:number= 3559;

  cuentaLuz:number= 11050;

  cuentaTelefono:number= 21307;

  public async PagarServiciosS(persona:Persona, servicio:string){
    switch(servicio){
      case "agua":
        const { value: bool } = await Swal.fire({
          title: 'Pagar',
          text: 'La cuenta a pagar es de $ '+this.cuentaAgua,
          showConfirmButton: true,
          confirmButtonText: 'Pagar',
          showCancelButton:true,
          cancelButtonText:"Rechazar"
        });
        if(!bool){
          Swal.fire({
            title: 'Cancelado',
            showConfirmButton: true,
            confirmButtonText: 'Aceptar',
          });
        }
        else{
        if (persona.saldo > this.cuentaAgua){
          persona.saldo = persona.saldo - this.cuentaAgua;
          Swal.fire({
            title: 'Pagado',
            text: 'El servicio se abono correctamente',
            showConfirmButton: true,
            confirmButtonText: 'Aceptar',
          });
        }
        else{
          Swal.fire({
            title: 'Error',
            icon:'error',
            text: 'Fondos insuficientes',
            showConfirmButton: true,
            confirmButtonText: 'Aceptar',
          });
        }
      }
      break

      case "luz":
        const { value: bool1 } = await Swal.fire({
          title: 'Pagar',
          text: 'La cuenta a pagar es de $ '+this.cuentaLuz,
          showConfirmButton: true,
          confirmButtonText: 'Pagar',
          showCancelButton:true,
          cancelButtonText:"Rechazar"
        });
        if(!bool1){
          Swal.fire({
            title: 'Cancelado',
            showConfirmButton: true,
            confirmButtonText: 'Aceptar',
          });
        }
        else{
        if (persona.saldo > this.cuentaLuz){
          persona.saldo = persona.saldo - this.cuentaLuz;
          Swal.fire({
            title: 'Pagado',
            text: 'El servicio se abono correctamente',
            showConfirmButton: true,
            confirmButtonText: 'Aceptar',
          });
        }
        else{
          Swal.fire({
            title: 'Error',
            icon:'error',
            text: 'Fondos insuficientes',
            showConfirmButton: true,
            confirmButtonText: 'Aceptar',
          });
        }
      }
      break

      case "gas":
        const { value: bool2 } = await Swal.fire({
          title: 'Pagar',
          text: 'La cuenta a pagar es de $ '+this.cuentaGas,
          showConfirmButton: true,
          confirmButtonText: 'Pagar',
          showCancelButton:true,
          cancelButtonText:"Rechazar"
        });
        if(!bool2){
          Swal.fire({
            title: 'Cancelado',
            showConfirmButton: true,
            confirmButtonText: 'Aceptar',
          });
        }
        else{
        if (persona.saldo > this.cuentaGas){
          persona.saldo = persona.saldo - this.cuentaGas;
          Swal.fire({
            title: 'Pagado',
            text: 'El servicio se abono correctamente',
            showConfirmButton: true,
            confirmButtonText: 'Aceptar',
          });
        }
        else{
          Swal.fire({
            title: 'Error',
            icon:'error',
            text: 'Fondos insuficientes',
            showConfirmButton: true,
            confirmButtonText: 'Aceptar',
          });
        }
      }
      break

      case "telefono":
        const { value: bool3 } = await Swal.fire({
          title: 'Pagar',
          text: 'La cuenta a pagar es de $ '+this.cuentaTelefono,
          showConfirmButton: true,
          confirmButtonText: 'Pagar',
          showCancelButton:true,
          cancelButtonText:"Rechazar"
        });
        if(!bool3){
          Swal.fire({
            title: 'Cancelado',
            showConfirmButton: true,
            confirmButtonText: 'Aceptar',
          });
        }
        else{
        if (persona.saldo > this.cuentaTelefono){
          persona.saldo = persona.saldo - this.cuentaTelefono;
          Swal.fire({
            title: 'Pagado',
            text: 'El servicio se abono correctamente',
            showConfirmButton: true,
            confirmButtonText: 'Aceptar',
          });
        }
        else{
          Swal.fire({
            title: 'Error',
            icon:'error',
            text: 'Fondos insuficientes',
            showConfirmButton: true,
            confirmButtonText: 'Aceptar',
          });
        }
      }
      break
    }

  }
}
