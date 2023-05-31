import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  // url: string = 'https://randomuser.me/api/';
  url: String = 'http://localhost:3000/';
  // Link a la API REST

  constructor(private http: HttpClient) {}

  ObtenerUltimosMovimientos(): Observable<any> {
    return this.http.get(this.url + 'movimientos');
  }

  // Todo lo de abajo es solo TEST, no tiene ninguna funcionalidad real x ahora
  get(url: string) {
    return this.http.get(this.url + url);
  }

  post(url: string, data: any) {
    return this.http.post(this.url + url, data);
  }

  put(url: string, data: any) {
    return this.http.put(this.url + url, data);
  }

  delete(url: string) {
    return this.http.delete(this.url + url);
  }

  login(username: string, password: string) {
    return this.post('login', { username, password });
  }

  register(
    username: string,
    password: string,
    email: string,
    telefono: string,
    domicilio: string,
    dni: string,
    nombre: string,
    apellido: string
  ) {
    return this.post('register', {
      username,
      password,
      email,
      telefono,
      domicilio,
      dni,
      nombre,
      apellido,
    });
  }

  getUsuarioByUsername(username: string) {
    return this.get('usuarios/username/' + username);
  }

  getUsuarioByDni(dni: string) {
    return this.get('usuarios/dni/' + dni);
  }
}
