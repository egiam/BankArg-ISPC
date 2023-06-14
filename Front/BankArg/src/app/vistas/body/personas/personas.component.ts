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
    this.cuenta.putPersonas(id, data).subscribe(() => {
      console.log('Persona editada correctamente');
    });
  }

  // eliminar
  eliminarButton(id: number) {
    console.log(id);
    this.cuenta.deletePersonas(id).subscribe(() => {
      console.log('Persona eliminada correctamente');
    });
  }

  nuevaPersona: any = {};

  // crear
  crearButton(data: any) {
    console.log(data);
    this.cuenta.postPersonas(data).subscribe(() => {
      console.log('Persona creada correctamente');
    });
  }
}
