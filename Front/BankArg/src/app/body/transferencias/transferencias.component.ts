import { Component } from '@angular/core';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-transferencias',
  templateUrl: './transferencias.component.html',
  styleUrls: ['./transferencias.component.css']
})
export class TransferenciasComponent {
  public Transferir() {
    Swal.fire({
        title: "Error",
        text: "Usted no tiene permisos para transferir",
        icon: "error",
        showConfirmButton:true,
        confirmButtonText:"Aceptar"
    });
};

public AgregarContacto(){
  Swal.fire({
    title: "Error",
    text: "Usted no tiene permisos para agregar contactos",
    icon: "error",
    showConfirmButton:true,
    confirmButtonText:"Aceptar"
  })
};

public Historial(){
  Swal.fire({
        title: "Error",
        text: "Usted no tiene permisos para ver el historial",
        icon: "error",
        showConfirmButton:true,
        confirmButtonText:"Aceptar"
  })
}

}
