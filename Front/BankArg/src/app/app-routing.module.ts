import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './body/home/home.component';
import { SobreComponent } from './body/sobre/sobre.component';
import { ProductosComponent } from './body/productos/productos.component';
import { TransferenciasComponent } from './body/transferencias/transferencias.component';
import { SoporteComponent } from './body/soporte/soporte.component';
import { ContactoComponent } from './body/contacto/contacto.component';
import { PerfilComponent } from './body/perfil/perfil.component';
import { HomeBankingComponent } from './body/home-banking/home-banking.component';
import { LoginComponent } from './login/login.component';
import { RegistroComponent } from './registro/registro.component';
import { PagosComponent } from './body/pagos/pagos.component';
import { ValidacionComponent } from './body/validacion/validacion.component';
import { PrestamosComponent } from './body/prestamos/prestamos.component';

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
  { path: '**', pathMatch: 'full', redirectTo: '' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
