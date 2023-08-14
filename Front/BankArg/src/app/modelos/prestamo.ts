export class Prestamo {
    id:number;
    monto:number;
    valor_cuota:number;
    cuota_num:number;
    cant_cuotas:number;
    id_cuenta:number;
    constructor(id:number,monto:number,valor_cuota:number,cuota_num:number,cant_cuotas:number,id_cuenta:number){
        this.id = id
        this.monto = monto
        this.valor_cuota = valor_cuota
        this.cuota_num = cuota_num
        this.cant_cuotas = cant_cuotas
        this.id_cuenta = id_cuenta

    }

}
