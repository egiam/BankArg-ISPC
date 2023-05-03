import { Component, Input } from '@angular/core';
import Swal from 'sweetalert2';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-prestamos',
  templateUrl: './prestamos.component.html',
  styleUrls: ['./prestamos.component.css']
})


export class PrestamosComponent {

  form:FormGroup;

  constructor(private formBuilder : FormBuilder){
    this.form=this.formBuilder.group({
      monto:undefined,
      cuotas:undefined
   })
  }

  get monto(){
    return this.form.get("monto");
  }

  get cuotas(){
    return this.form.get("cuotas");
  }

  

  public Solicitar() {

    let montoValue = this.monto?.value
    let cuotasValue = this.cuotas?.value

    if (montoValue === null || cuotasValue === null) {
        Swal.fire({
            title: "Error",
            text: "Todos los campos son obligatorios",
            icon: "error",
            showConfirmButton:true,
            confirmButtonText:"Aceptar"
          
        });
    } else {
        Swal.fire({
            title: "Solicitud enviada",
            text: "La solicitud se ha enviado correctamente, estaremos en contacto con usted",
            icon: "success",
            showConfirmButton:true,
            confirmButtonText:"Aceptar"
        })
    }
}
;
}