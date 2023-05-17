import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class PrestamoService {

  constructor() { }

  public PedirPrestamo(cuotas:number, monto:number){
    let interes:number;
    switch(cuotas){
      case 3:
        interes = 33
        break;
      case 6:
        interes = 66
        break
      case 12:
        interes = 132
        break
      case 18:
        interes = 198
        break
      case 24:
        interes = 264
    }

    var montoADevolver =monto + ((interes! * monto) / 100);

    var cuotaADevolver = montoADevolver / cuotas;

    return cuotaADevolver
  }
}
