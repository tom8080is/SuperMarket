import { Component, Input, OnChanges, OnInit, SimpleChange } from '@angular/core';
import { ProductService } from 'src/app/services/products.service';
import { StateService } from 'src/app/services/state.service';
import { HotToastService } from '@ngneat/hot-toast';

@Component({
  selector: 'app-admin-manage-product',
  templateUrl: './admin-manage-product.component.html',
  styleUrls: ['./admin-manage-product.component.css']
})


export class AdminManageProductComponent implements OnInit {
  public productName: string;
  public price: number;
  public image: string;
  public categoryId: number;
  public productId: string;
  public isAdminEdit: boolean = false
  public path: number = 0

  constructor(public stateService: StateService, public productServices: ProductService,  private toastService: HotToastService) {
    this.productName = this.stateService.productToEdit.productName
    this.price = this.stateService.productToEdit.price
    this.image = this.stateService.productToEdit.image
    this.categoryId = this.stateService.productToEdit.categoryId
    this.productId = this.stateService.productToEdit.productId
  }

  ngOnInit(): void {
    console.log(this.stateService.productToEdit);
  }
  public onCloseManageClick() {
    this.stateService.isManageProductClicked = false
  }

  public onUpdateProductClick() {

    
    let newProductDetails = { productName: this.productName, price: this.price, categoryId: this.categoryId, image: this.image, productId: this.productId }

    const observable = this.productServices.updateProduct(newProductDetails)
    observable.subscribe((successfulServerRequestData) => {
      console.log(successfulServerRequestData);
      this.stateService.getAllProduct()
      this.stateService.isManageProductClicked = false
      this.toastService.success('Product Updated')

    }, ServerErrorResponse => {
      this.stateService.isServerError = this.stateService.isServerError ? true : true;
      this.stateService.serverError = JSON.parse(JSON.stringify(ServerErrorResponse.error.error))
     
    })
  }


  public onAddNewProductClick() {
    let newProduct = { productName: this.productName, price: this.price, categoryId: this.categoryId, image: this.image }
    console.log(newProduct);

    const observable = this.productServices.addNewProduct(newProduct)
    observable.subscribe((successfulServerRequestData) => {
      console.log(successfulServerRequestData);
      this.stateService.getAllProduct()
      this.stateService.isManageProductClicked = false
      this.toastService.success('Product Added')

    },ServerErrorResponse => {
      this.stateService.isServerError = this.stateService.isServerError ? true : true;
      this.stateService.serverError = JSON.parse(JSON.stringify(ServerErrorResponse.error.error))
    })
  }

  public onOptionSelected(event: any) {
    this.categoryId = event.target.value;
  }

  public onClearInputs() {
    this.productName = ""
    this.price = 0
    this.categoryId = 0
    this.productName = ""
    this.image = ""
    this.stateService.productToEdit = ""

      console.log(this.stateService.productToEdit);
  }






  
}





