import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, map, toArray } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  // url: string = 'https://randomuser.me/api/';
  url: String = 'http://localhost:3000/';
  urlUser: String = 'http://127.0.0.1:8000/'; // Backend
  // Link a la API REST

  constructor(private http: HttpClient) {}

  // Registrarse (email, username, password)
  register(UserData: any): Observable<any> {
    return this.http.post('http://127.0.0.1:8000/api/auth/signup/', UserData);
    // return this.http.post('http://127.0.0.1:8000/api/auth/register/', UserData);
  }

  // Logearse
  login(UserData: any): Observable<any> {
    return this.http.post('http://127.0.0.1:8000/api/auth/login/', UserData);
  }

  ObtenerUltimosMovimientos(): Observable<any> {
    return this.http.get(this.url + 'movimientos');
  }

  //

  getPersonas(): Observable<any> {
    // return this.http.get<any>(this.urlUser + 'api/persona/');
    return this.http.get<any>(this.urlUser + 'api/persona_gral/');
  }

  putPersonas(id: number, data: any): Observable<any> {
    return this.http.put(this.urlUser + 'api/persona/' + id + '/', data);
  }

  deletePersonas(id: number): Observable<any> {
    return this.http.delete(this.urlUser + 'api/persona/' + id + '/');
  }

  postPersonas(data: any): Observable<any> {
    return this.http.post(this.urlUser + 'api/persona/', data);
  }

  //

  getDocumentosById(id: number): Observable<any> {
    console.log('documento id ' + id);
    return this.http.get<any>(this.urlUser + 'api/documento/' + id + '/');
  }

  getDocumentos(): Observable<any> {
    return this.http.get<any>(this.urlUser + 'api/documento/');
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

  // login(username: string, password: string) {
  //   return this.post('login', { username, password });
  // }

  // register(
  //   username: string,
  //   password: string,
  //   email: string,
  //   telefono: string,
  //   domicilio: string,
  //   dni: string,
  //   nombre: string,
  //   apellido: string
  // ) {
  //   return this.post('register', {
  //     username,
  //     password,
  //     email,
  //     telefono,
  //     domicilio,
  //     dni,
  //     nombre,
  //     apellido,
  //   });
  // }

  getUsuarioByUsername(username: string) {
    return this.get('usuarios/username/' + username);
  }

  getUsuarioByDni(dni: string) {
    return this.get('usuarios/dni/' + dni);
  }
}
