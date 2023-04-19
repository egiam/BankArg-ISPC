import { Component, ViewChild } from '@angular/core';

@Component({
  selector: 'app-contacto',
  templateUrl: './contacto.component.html',
  styleUrls: ['./contacto.component.css']
})
export class ContactoComponent {
  @ViewChild('myForm')
  myForm!: { nativeElement: any; };

  onSubmit() {
    // Obtener el elemento DOM del formulario
    const form = this.myForm.nativeElement;

    // Enviar el formulario
    form.submit();
  }

}
