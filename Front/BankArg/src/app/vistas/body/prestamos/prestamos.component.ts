import { Component, Input } from '@angular/core';
import Swal from 'sweetalert2';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { PrestamoService } from 'src/app/servicios/services/prestamo.service';

@Component({
  selector: 'app-prestamos',
  templateUrl: './prestamos.component.html',
  styleUrls: ['./prestamos.component.css']
})


export class PrestamosComponent {

  form:FormGroup;

  constructor(private formBuilder : FormBuilder, public prestamoS:PrestamoService){
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
      var cuotaValor = this.prestamoS.PedirPrestamo(parseInt(cuotasValue),montoValue)
        Swal.fire({
            title: "Solicitud enviada",
            text: "Debera devolver un total de "+ cuotasValue+" cuotas"+" de  $"+cuotaValor,
            icon: "success",
            showConfirmButton:true,
            confirmButtonText:"Aceptar"
        })
    }
}
;
}