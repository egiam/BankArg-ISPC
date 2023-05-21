import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class CuentaAhorroService {
  private saldo: number;
  constructor() {
    this.saldo = 0;
  }

  depositar(cantidad: number): void {
    this.saldo += cantidad;
  }

  retirar(cantidad: number): void {
    if (cantidad <= this.saldo) {
      this.saldo -= cantidad;
    } else {
      console.log('Saldo insuficiente');
    }
  }

  obtenerSaldo(): number {
    return this.saldo;
  }
}
