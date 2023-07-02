import { Component } from '@angular/core';
import { IPayPalConfig } from 'ngx-paypal';
import { Prestamo } from 'src/app/modelos/prestamo';
import { Tarjeta } from 'src/app/modelos/tarjeta';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-pago-tarjetas',
  templateUrl: './pago-tarjetas.component.html',
  styleUrls: ['./pago-tarjetas.component.css']
})
export class PagoTarjetasComponent {

  tarjeta = new Tarjeta(1,1234567812345678,1234,8727)

  num_tarjeta = this.tarjeta.numero_tarjeta.toString()
  number_censurado!: string;
  
  public num_censurado():string{
    let i:number;

    for(i=1 ; i < this.num_tarjeta.length ; i++){
      if(i < 12){
        this.number_censurado += "*"
      }
      else{
        this.number_censurado += this.num_tarjeta[i]
      }
    }
    return this.number_censurado
  } 
  
  public payPalConfig ? : IPayPalConfig;

  ngOnInit(): void {
      this.initConfig();
      this.num_censurado();
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
              value: String(this.tarjeta.deuda),
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
        Swal.fire({
          title: "Aprobado",
          text: "Pago aprobado",
          icon: "success",
          showConfirmButton:true,
          confirmButtonText:"Aceptar"
      });
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
}
