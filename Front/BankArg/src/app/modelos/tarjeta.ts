export class Tarjeta {
    id_tarjeta:number;
    numero_tarjeta:number;
    codigo_seguridad:number;
    deuda:number;

    constructor(id_tarjeta:number,numero_tarjeta:number,codigo_seguridad:number,deuda:number){
        this.id_tarjeta=id_tarjeta
        this.numero_tarjeta=numero_tarjeta
        this.codigo_seguridad=codigo_seguridad
        this.deuda=deuda
    }

}
