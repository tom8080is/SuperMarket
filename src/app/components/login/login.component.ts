import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserModel } from 'src/app/models/UserModel';
import { CartService } from 'src/app/services/cart.service';
import { StateService } from 'src/app/services/state.service';
import { UsersService } from 'src/app/services/user.service';
import { HotToastService } from '@ngneat/hot-toast';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})


export class LoginComponent implements OnInit {
  username: string = "";
  password: string = "";

  constructor(private usersService: UsersService, private router: Router, public stateService: StateService, private toastService: HotToastService) { }

  ngOnInit(): void {
    this.stateService.serverError = " "
  }


  public onLoginClick() {
    
    let loginDeatils = new UserModel(this.username, this.password);
    const observable = this.usersService.login(loginDeatils)

    observable.subscribe((successfulServerRequestData) => {
      console.log(successfulServerRequestData);

    
      localStorage.setItem('token', JSON.stringify(successfulServerRequestData))


      this.router.navigate(['/home']).then(() => {
      });
     
      this.toastService.success('Welcome Back !')


    }, ServerErrorResponse => {
      
      this.stateService.isServerError = this.stateService.isServerError ? true : true;
      this.stateService.serverError = JSON.parse(JSON.stringify(ServerErrorResponse.error.error))
    })

  }

}

