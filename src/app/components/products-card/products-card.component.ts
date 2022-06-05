import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { IProducts } from 'src/app/models/IProducts';
import { CartService } from 'src/app/services/cart.service';
import { StateService } from 'src/app/services/state.service';
import { UsersService } from 'src/app/services/user.service';
import { HotToastService } from '@ngneat/hot-toast';

@Component({
  selector: 'app-products-card',
  templateUrl: './products-card.component.html',
  styleUrls: ['./products-card.component.css']
})
export class ProductsCardComponent implements OnInit {
  @Input() product: IProducts | any;

  public amount:number = 1;
  public isAddToCartBtnClicked: boolean = false;
  public productId: any=0
  public buyClass: boolean = false



  constructor(private toastService: HotToastService , public stateService: StateService, public cartService: CartService) { }

  ngOnInit(): void {
    this.stateService.serverError = " "
  }

  public onOkClick(product: any) {
  console.log(this.stateService.carts);

  console.log(this.stateService.cartId);
  this.stateService.cartId;
   let found = this.stateService.carts.find((item: { productId: any; }) => item.productId == product.productId);
    if (found) {
      this.amount += found.amount
      let productToUpdate = { productId: product.productId, amount: this.amount, cartId: this.stateService.cartId, totalPrice: (product.price * this.amount) }
      const observable = this.cartService.updateCart(productToUpdate)
      let index = this.stateService.carts.indexOf(found)
      this.stateService.carts[index].amount = this.amount
      let filter = this.stateService.carts;
      this.stateService.carts = [...filter]
      this.amount = 1;
    }
  
    else {
      let productToCart = { cartId: this.stateService.cartId, amount: this.amount, totalPrice: (product.price * this.amount), productId: product.productId }
      const observable = this.cartService.addToCart(productToCart)
      this.stateService.carts.push({ image: product.image, productName: product.productName, amount: this.amount, price: product.price, productId: product.productId });
      let filter = this.stateService.carts
      this.stateService.carts = [...filter]
    };
    this.stateService.totalProductInCart ()
    this.amount = 1;
    this.toastService.success('Product added to cart')
  }


  public onEditClick(product: any) {
    console.log(product);
    this.stateService.isServerError = false
    this.stateService.isManageProductClicked = true;
    this.stateService.productToEdit = this.product
  }

  // public resetAmount() {
  //   this.amount = 0;
  // }

public onPlusClick(){
 this.amount++
}
public onMinusClick(){
  if(this.amount>1){
  this.amount--
  }
 }

  // public onBuyClick() {    
  //   this.buyClass = true
  // }

  // public onDoneClick() {
  //   this.buyClass = false

  // }



  // $('.buy').click(function() {
  //   $('.bottom').addClass("clicked");
  // });

  // $('.done').click(function() {
  //   $('.bottom').removeClass("clicked");
  // });

}
