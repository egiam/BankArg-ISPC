export class Persona {
    id: number;
    nombre: string;
    saldo:number;
    alias:string;
    cbu:string;
;

    constructor(id:number, nombre: string, saldo:number, alias:string, cbu:string){
        this.id = id
        this.nombre = nombre;
        this.saldo = saldo;
        this.alias = alias;
        this.cbu = cbu;
    }
}