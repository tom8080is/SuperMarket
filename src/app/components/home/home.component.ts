import { Component, NgModule, OnInit } from '@angular/core';
import { ProductService } from 'src/app/services/products.service';
import { IProducts } from 'src/app/models/IProducts';
import { ActivatedRoute, Router } from '@angular/router';
import { StateService } from 'src/app/services/state.service';
import { CartService } from 'src/app/services/cart.service';
import { ICart } from 'src/app/models/ICart';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})


export class HomeComponent implements OnInit {
  public userType :string = ''
  constructor(
    public stateService: StateService,
    public productServices: ProductService,
    private router: Router,
    private route: ActivatedRoute,
    public cartService: CartService,
    
  ) { }

  ngOnInit(): void {
    let token: any = localStorage.getItem("token");
    if (token) {
      let parsedToken = (JSON.parse(token))
      this.stateService.username = parsedToken.username
      this.stateService.isLoggedIn = true
      this.userType = parsedToken.userType
      if (this.userType == "ADMIN") {
        this.stateService.isAdmin = true
      } else {
        this.stateService.isAdmin = false
      }

    }
      
    const observable1 = this.cartService.getCart();
    observable1.subscribe(cart => {
      
      if(cart[0].items== undefined){
        this.stateService.carts = []
      }
      else{
        this.stateService.carts = cart[0].items
      }
      this.stateService.cartId = cart[0].cartId
      this.stateService.totalProductInCart ()
      console.log(this.stateService.carts);
      
    })
    this.stateService.getAllProduct()
  }



  




}
