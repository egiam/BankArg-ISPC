import { Component } from '@angular/core';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-prestamos',
  templateUrl: './prestamos.component.html',
  styleUrls: ['./prestamos.component.css']
})


export class PrestamosComponent {

  monto:any=""
  cuotas:any=""


  public Solicitar() {
    console.log("monto",this.monto," cuotas ",this.cuotas)
    // if (this.monto === undefined || this.cuotas === undefined) {
    //     Swal.fire({
    //         title: "Error",
    //         text: "Todos los campos son obligatorios",
    //         icon: "error",
    //         showConfirmButton:true,
    //         confirmButtonText:"Aceptar"
          
    //     });
    // } else {
    //     Swal.fire({
    //         title: "Solicitud enviada",
    //         text: "La solicitud se ha enviado correctamente, estaremos en contacto con usted",
    //         icon: "success",
    //         showConfirmButton:true,
    //         confirmButtonText:"Aceptar"
    //     })
    // }
};
}
