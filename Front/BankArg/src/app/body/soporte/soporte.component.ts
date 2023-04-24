import { Component } from '@angular/core';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-soporte',
  templateUrl: './soporte.component.html',
  styleUrls: ['./soporte.component.css']
})
export class SoporteComponent {
  public funcionNoActiva() {
    Swal.fire({
        title: "Error",
        text: "Esta funcion no esta activada por ahora, lo sentimos.",
        icon: "error",
        showConfirmButton:true,
        confirmButtonText:"Aceptar"
    });
};
}
