import { Component } from '@angular/core';
import { Persona } from 'src/app/modelos/persona';
import { ApiService } from 'src/app/servicios/api/api.service';
import { CuentaAhorroService } from 'src/app/servicios/services/cuenta-ahorro.service';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-cuenta-ahorro',
  templateUrl: './cuenta-ahorro.component.html',
  styleUrls: ['./cuenta-ahorro.component.css'],
})
export class CuentaAhorroComponent {
  constructor(
    public cuentaAhorroS: CuentaAhorroService,
    private cuenta: ApiService
  ) {}
  persona1 = new Persona(1, 'admin', 10000, 'admin', '10101010');
  formateador = new Intl.NumberFormat('en');
  saldoformateado = this.formateador.format(this.persona1.saldo);

  public async retirar() {
    const { value: montoRetirar } = await Swal.fire({
      title: 'Monto a retirar',
      input: 'text',
      inputValue: '',
    });
    this.cuentaAhorroS.retirar(montoRetirar, this.persona1);
  }
  public async depositar() {
    const { value: montoDepositar } = await Swal.fire({
      title: 'Monto a depositar',
      input: 'text',
      inputValue: '',
    });
    this.cuentaAhorroS.depositar(montoDepositar, this.persona1);
  }
}
