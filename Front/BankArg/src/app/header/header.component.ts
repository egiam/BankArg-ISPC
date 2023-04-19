import { Component } from '@angular/core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css'],
})
export class HeaderComponent {

  validacion = false

  public change() {
    if (this.validacion === true){
     this.validacion = false
  }
    else{
      this.validacion = true
  }

}
}
