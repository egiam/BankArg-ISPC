import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './vistas/body/home/home.component';
import { SobreComponent } from './vistas/body/sobre/sobre.component';
import { ProductosComponent } from './vistas/body/productos/productos.component';
import { TransferenciasComponent } from './vistas/body/transferencias/transferencias.component';
import { SoporteComponent } from './vistas/body/soporte/soporte.component';
import { ContactoComponent } from './vistas/body/contacto/contacto.component';
import { PerfilComponent } from './vistas/body/perfil/perfil.component';
import { HomeBankingComponent } from './vistas/body/home-banking/home-banking.component';
import { LoginComponent } from './vistas/login/login.component';
import { RegistroComponent } from './vistas/registro/registro.component';
import { PagosComponent } from './vistas/pagos/pagos.component';
import { ValidacionComponent } from './vistas/body/validacion/validacion.component';
import { PrestamosComponent } from './vistas/body/prestamos/prestamos.component';
import { CuentaAhorroComponent } from './vistas/body/cuenta-ahorro/cuenta-ahorro.component';
import { PersonasComponent } from './vistas/body/personas/personas.component';
import { PlazoFijoComponent } from './vistas/body/plazo-fijo/plazo-fijo.component';
import { TransferenciasListaComponent } from './vistas/body/transferencias-lista/transferencias-lista.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'sobre', component: SobreComponent },
  { path: 'productos', component: ProductosComponent },
  { path: 'transferencias', component: TransferenciasComponent },
  { path: 'soporte', component: SoporteComponent },
  { path: 'contacto', component: ContactoComponent },
  { path: 'perfil', component: PerfilComponent },
  { path: 'homeBanking', component: HomeBankingComponent },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegistroComponent },
  { path: 'pagos', component: PagosComponent },
  { path: 'validacion', component: ValidacionComponent },
  { path: 'prestamos', component: PrestamosComponent },
  { path: 'cuentaAhorro', component: CuentaAhorroComponent },
  { path: 'personas', component: PersonasComponent },
  { path: 'plazoFijo', component: PlazoFijoComponent },
  { path: 'transferenciasLista', component: TransferenciasListaComponent },
  { path: '**', pathMatch: 'full', redirectTo: '' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
