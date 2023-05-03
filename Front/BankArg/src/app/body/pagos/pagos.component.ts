import { Component } from '@angular/core';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-pagos',
  templateUrl: './pagos.component.html',
  styleUrls: ['./pagos.component.css']
})
export class PagosComponent {

public NoDisponible() {
  Swal.fire({
      title: "Error",
      text: "Esta pagina no esta disponible actualmente, lo sentimos",
      icon: "error",
      showConfirmButton:true,
      confirmButtonText:"Aceptar"
  });
};


}

