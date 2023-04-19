import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';

import { AppComponent } from './app.component';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
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

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    HomeComponent,
    SobreComponent,
    ProductosComponent,
    TransferenciasComponent,
    SoporteComponent,
    ContactoComponent,
    PerfilComponent,
    HomeBankingComponent,
    LoginComponent,
    RegistroComponent,
    PagosComponent,
    ValidacionComponent,
    PrestamosComponent,
  ],
  imports: [BrowserModule, AppRoutingModule],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
