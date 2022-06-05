import { DatePipe } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { CartService } from 'src/app/services/cart.service';
import { StateService } from 'src/app/services/state.service';
import { UsersService } from 'src/app/services/user.service';
import { NgbActiveModal, NgbModal, NgbCalendar, NgbDateStruct, NgbDate } from '@ng-bootstrap/ng-bootstrap';
import { HotToastService } from '@ngneat/hot-toast';
@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css'],


})



export class CheckoutComponent implements OnInit {

  public userData: any = {}
  public firstName: string = ""
  public lastName: string = ""
  public city: string = ""
  public address: string = ""
  public shippingDate: any = {}
  public creditNum: string = ""
  public today: any = ""
  public fixedDate: any = ""
  public unavailableDate: any = {}
  public userType: string = " "
  public match: any
  public model: NgbDateStruct | undefined;
  public disabledDate: any
  public minDate: any
  public markDisabled: any

  constructor(public stateService: StateService, public cartService: CartService, public userService: UsersService, public datepipe: DatePipe, private router: Router, private modalService: NgbModal, private calendar: NgbCalendar, private toastService: HotToastService) {


  }

  ngOnInit(): void {
    this.stateService.serverError = " "

    let token: any = localStorage.getItem("token");
    let parsedToken = (JSON.parse(token))
    this.userType = parsedToken.userType
    if (this.userType == "ADMIN") {
      this.router.navigate(['/landingPage'])
    }


    const observable = this.cartService.getUnavailableOrderDates();
    observable.subscribe(unavailable => {
      this.unavailableDate = unavailable
     
    }, error => {
      this.toastService.error('Failed to get info'+ JSON.stringify(error))
    })

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
     
      
    
    }, error => {
      this.toastService.error('Failed to get info'+ JSON.stringify(error))
    })

    const observable2 = this.userService.getPersonalInfo();
    observable2.subscribe(info => {
      this.userData = info[0]
    }, error => {
      this.toastService.error('Failed to get info'+ JSON.stringify(error))
    })

    const current = new Date();
    this.minDate = {
      year: current.getFullYear(),
      month: current.getMonth() + 1,
      day: current.getDate()
    };
  }

  public getDate() {

    //** OPT 1 
    this.today = new Date();
    let dd: any = this.today.getDate();
    let mm: any = this.today.getMonth() + 1;
    let yyyy: any = this.today.getFullYear();
    let hour: any = this.today.getHours();
    let min: any = this.today.getMinutes();

    if (dd < 10) {
      dd = "0" + dd;
    }
    if (mm < 10) {
      mm = "0" + mm;
    }
    if (min < 10) {
      min = "0" + min;
    }
    if (hour < 10) {
      hour = "0" + hour;
    }
    this.today = yyyy + "-" + mm + "-" + dd;
    let now = hour + ":" + min;

    this.fixedDate = this.today + " " + now;
    return this.fixedDate;

    // // *** OPT 2
    // this.date = new Date();
    // let latest_date = this.datepipe.transform(this.date, 'yyyy-MM-dd');
    // return latest_date
  }



  public onFirstNameDbClick() {
    this.firstName = this.userData.firstName
  }

  public onLastNameDbClick() {
    this.lastName = this.userData.lastName
  }

  public onCityDbClick() {
    this.city = this.userData.city
  }

  public onaddressDbClick() {
    this.address = this.userData.address
  }

  public onCheckoutClick() {
  
    
     
    if(this.shippingDate != undefined){
    this.shippingDate = (`${this.shippingDate.year}` + "-" + `${this.shippingDate.month}` + "-" + `${this.shippingDate.day}`);
    }
    let checkoutDeatils = { firstName: this.firstName, lastName: this.lastName, totalPrice: this.stateService.totalCartPrice, city: this.city, address: this.address, shippingDate: this.shippingDate, orderDate: this.getDate(), creditNum: this.creditNum, };

    const observable = this.cartService.checkout(checkoutDeatils)

    observable.subscribe((successfulServerRequestData) => {
      console.log(successfulServerRequestData);
      this.stateService.currentOrder = successfulServerRequestData
      console.log(this.stateService.currentOrder);

      this.toastService.success('Purshace Success')
      this.router.navigate(['/after-checkout'])
    }, ServerErrorResponse => {
      this.shippingDate = {}
      console.log(this.shippingDate);
      
      this.stateService.isServerError = this.stateService.isServerError ? true : true;
      this.stateService.serverError = JSON.parse(JSON.stringify(ServerErrorResponse.error.error))
    
    })
  
  }

  //   getDayMonthYear() {
  //     // slash numer 3   
  //     let date: any = this.unavailableDate

  //     const reDate = /([0-9]{4})-([0-9]{2})-([0-9]{2})/
  //     this.match = reDate.exec(date)


  //     this.disabledDate = {
  //       year: +this.match[1],
  //       month: +this.match[2],
  //       day: +this.match[3]
  // }    
  //     console.log("********");
  //     console.log(this.disabledDate );
  //     console.log("********");

  //   }



}
