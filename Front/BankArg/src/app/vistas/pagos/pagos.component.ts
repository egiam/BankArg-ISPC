import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Persona } from 'src/app/modelos/persona';
import { PagarServiciosService } from 'src/app/servicios/services/pagar-servicios.service';
import Swal from 'sweetalert2';
import { PayPalScriptService, IPayPalConfig, ICreateOrderRequest } from 'ngx-paypal';



@Component({
  selector: 'app-pagos',
  templateUrl: './pagos.component.html',
  styleUrls: ['./pagos.component.css']
})
export class PagosComponent implements OnInit{
  constructor(public pagarS:PagarServiciosService){
  }

  precio_servicio!: number;
  
  public payPalConfig ? : IPayPalConfig;

  ngOnInit(): void {
      this.initConfig();
  }

  private initConfig(): void {
    this.payPalConfig = {
      clientId: 'Aerrc3RdM9D0l0A6T6wLwM_gKChGVw27OyErFM-h9mWG3_3V-cRI8Qw02HKEF4pbfO_Po8lgi6ZP91ux',
      currency: 'USD',
      createOrderOnClient : (data: any) => ({
        intent: 'CAPTURE',
        purchase_units: [
          {
            amount: {
              currency_code: 'USD',
              value: String(this.precio_servicio),
            },
            items:[]
          },
        ],
      }),
      advanced: {
        commit: 'true',
      },
      style: {
        label: 'paypal',
        layout: 'vertical',
        color: 'blue',
        shape: 'rect',
      },
      onApprove: (data, actions) => {
        console.log('onApprove - transaction was approved, but not authorized', data, actions);
        actions.order.get().then((details: any) => {
        console.log('onApprove - you can get full order details inside onApprove: ', details);
        });
      },
      onClientAuthorization: (data) => {
        console.log('onClientAuthorization - you should probably inform your server about completed transaction at this point', data);
      },
      onCancel: (data, actions) => {
        console.log('OnCancel', data, actions);
      },
      onError: err => {
        console.log('OnError', err);
      },
      onClick: (data, actions) => {
        console.log('onClick', data, actions);
      },
    };
  }
  
  persona1 = new Persona(1, 'admin', 10000.5, 'admin', '10101010');

public NoDisponible() {
  Swal.fire({
      title: "Error",
      text: "Esta pagina no esta disponible actualmente, lo sentimos",
      icon: "error",
      showConfirmButton:true,
      confirmButtonText:"Aceptar"
  });
};

public async PagoDeServicio(){
  const { value: servicio } = await Swal.fire({
    title: "Servicio",
    text: "¿Que servicio desea pagar?",
    input:"select",
    inputOptions:{
      agua:"Agua",
      luz:"Luz",
      gas:"Gas",
      telefono:"Telefono"
    },
    showConfirmButton:true,
    confirmButtonText:"Aceptar"
});
  this.pagarS.PagarServiciosS(this.persona1,servicio)

}


}

