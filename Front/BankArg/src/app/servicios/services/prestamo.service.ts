import { Injectable } from '@angular/core';
import { Persona } from 'src/app/modelos/persona';

@Injectable({
  providedIn: 'root'
})
export class PrestamoService {

  constructor() { }

  persona1 = new Persona(1, "admin", 10000.1,"admin", "10101010")

  public PedirPrestamo(cuotas:number, monto:number){
    this.persona1.saldo = this.persona1.saldo + monto;
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
