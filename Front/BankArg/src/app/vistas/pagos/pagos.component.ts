import { Component } from '@angular/core';
import { Persona } from 'src/app/modelos/persona';
import { PagarServiciosService } from 'src/app/servicios/services/pagar-servicios.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-pagos',
  templateUrl: './pagos.component.html',
  styleUrls: ['./pagos.component.css']
})
export class PagosComponent {
  constructor(public pagarS:PagarServiciosService){
  }

  persona1 = new Persona(1, 'admin', 10000.5, 'admin', '10101010');

public NoDisponible() {
  Swal.fire({
      title: "Error",
      text: "Esta pagina no esta disponible actualmente, lo sentimos",
      icon: "error",
      showConfirmButton:true,
      confirmButtonText:"Aceptar"
  });
};

public async PagoDeServicio(){
  const { value: servicio } = await Swal.fire({
    title: "Servicio",
    text: "¿Que servicio desea pagar?",
    input:"select",
    inputOptions:{
      agua:"Agua",
      luz:"Luz",
      gas:"Gas"
    },
    showConfirmButton:true,
    confirmButtonText:"Aceptar"
});
  this.pagarS.PagarServiciosS(this.persona1,servicio)

}


}

