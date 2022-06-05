import { Component, OnInit } from '@angular/core';
import { CartService } from 'src/app/services/cart.service';
import { ProductService } from 'src/app/services/products.service';
import { StateService } from 'src/app/services/state.service';
import { HotToastService } from '@ngneat/hot-toast';
@Component({
  selector: 'app-landing-page',
  templateUrl: './landing-page.component.html',
  styleUrls: ['./landing-page.component.css']
})
export class LandingPageComponent implements OnInit {

  public username: string = " "
  public userType: string = " "
  public totalOrders: any
  public totalProduct: any

  constructor(private toastService: HotToastService,public stateService: StateService, public cartService: CartService, public productServices: ProductService) { }

  ngOnInit(): void {
    let token: any = localStorage.getItem("token");
    if (token) {
      let parsedToken = (JSON.parse(token))
      this.username = parsedToken.username
      this.stateService.isLoggedIn = true
      this.userType = parsedToken.userType
      if (this.userType == "ADMIN") {
        this.stateService.isAdmin = true
      } else {
        this.stateService.isAdmin = false
      }


      const observable = this.cartService.getCart();
      observable.subscribe(cart => {
      
        if(cart[0].items == undefined){
          this.stateService.carts = []
        }
        else{
          this.stateService.carts = cart[0].items
        }
        this.stateService.cartId = cart[0].cartId
        this.stateService.totalProductInCart ()
        console.log(this.stateService.carts);

      }, error => {
        this.toastService.error('Server Error ' + JSON.stringify(error));
      })
    }

    const observable1 = this.cartService.getTotalOrders();
    observable1.subscribe(total => {
      this.totalOrders = total
    }, error => {
      this.toastService.error('Server Error ' + JSON.stringify(error));
    })

    const observable2 = this.productServices.getAllProducts();
    observable2.subscribe(total => {
      this.totalProduct = total.length
    }, error => {
      this.toastService.error('Server Error ' + JSON.stringify(error));
    })


  }

}
