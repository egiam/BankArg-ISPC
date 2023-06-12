import { Component } from '@angular/core';
import { ApiService } from 'src/app/servicios/api/api.service';

@Component({
  selector: 'app-personas',
  templateUrl: './personas.component.html',
  styleUrls: ['./personas.component.css'],
})
export class PersonasComponent {
  constructor(private cuenta: ApiService) {}

  personas: any = this.cuenta.getPersonas();

  // editar
  editarButton(id: number, data: any) {
    this.cuenta.putPersonas(id, data);
  }

  // eliminar
  eliminarButton(id: number) {
    this.cuenta.deletePersonas(id);
  }
}
