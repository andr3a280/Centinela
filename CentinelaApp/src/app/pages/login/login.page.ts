import { Component, OnInit } from '@angular/core';
import { AlertController, LoadingController } from '@ionic/angular';
import { UsuarioModule } from '../../models/usuario/usuario.module';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {

  usuarios: UsuarioModule = new UsuarioModule();

  constructor(
    private alertController: AlertController,
    private loadingController: LoadingController
  ) { }

  ngOnInit() {
  }

  async alertMsg(sheader, mensaje){
    const alert = await this.alertController.create({
      header: 'Alerta',
      subHeader: sheader,
      message: mensaje,
      buttons: ['Aceptar']
    });
  }

  validarFormulario(form){
    if (this.usuarios.email == "" || this.usuarios.password == "") {
      this.alertMsg("Ocurrió un error", "Por favor, rellene todos los campos solicitados.");
    } else {
      console.log(this.usuarios.email, this.usuarios.password);
    }
  }
}
