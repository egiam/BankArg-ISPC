import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';

import { AppComponent } from './app.component';
import { HeaderComponent } from './vistas/header/header.component';
import { FooterComponent } from './vistas/footer/footer.component';
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
import { FormBuilder, FormGroup, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { CuentaAhorroComponent } from './vistas/body/cuenta-ahorro/cuenta-ahorro.component';

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
    CuentaAhorroComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
