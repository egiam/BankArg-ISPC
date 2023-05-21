import { Injectable } from '@angular/core';
import { Persona } from 'src/app/modelos/persona';

@Injectable({
  providedIn: 'root'
})
export class TransferirService {

  constructor() { }

  
  

  public TransferirMontoAPersona(monto:number, persona1:Persona,persona2:Persona){

    if(monto > persona1.saldo){
      alert("El monto supera su saldo")
    }else{
      persona1.saldo= persona1.saldo - monto;
      persona2.saldo= persona2.saldo + monto
    }
  }

  
}