import { Component } from '@angular/core';
import { IPayPalConfig } from 'ngx-paypal';
import Swal from 'sweetalert2';
import { Prestamo } from 'src/app/modelos/prestamo';

@Component({
  selector: 'app-pago-prestamos',
  templateUrl: './pago-prestamos.component.html',
  styleUrls: ['./pago-prestamos.component.css']
})
export class PagoPrestamosComponent {

  prestamo = new Prestamo(1,20000,8866,2,3,1)
  
  dia = new Date(2017, 3, 22, 5, 23, 50)
  public payPalConfig ? : IPayPalConfig;

  ngOnInit(): void {
      this.initConfig();
      console.log(this.dia)
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
              value: String(this.prestamo.valor_cuota),
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

