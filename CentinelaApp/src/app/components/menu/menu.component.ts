import { Component, OnInit } from '@angular/core';
import { ServiceService } from '../../services/service.service';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.scss'],
})
export class MenuComponent implements OnInit {

  menu: any;

  constructor(
    private service: ServiceService
  ) { }

  ngOnInit() {
    this.service.getMenu().subscribe(
      res => {
        this.menu = res;
      }
    );
  }

}
