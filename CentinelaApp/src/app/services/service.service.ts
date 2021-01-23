import { Injectable, Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(
    private http: HttpClient
  ) { }

  getMenu(){
    return this.http.get<Component[]>('../assets/menu.json');
  }
}
