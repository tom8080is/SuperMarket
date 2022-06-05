const express = require("express");
const router = express.Router();
const cartLogic = require("../logic/cart-logic");
const cacheModule = require("../logic/cache-module");
const createInovice = require("../logic/inovice");
const path = require("path");

router.get("/", async (request, response, next) => {
  try {
    let userData = await cacheModule.extractUserDataFromCache(request);
    let userId = userData.userId;
    let cart = await cartLogic.getCart(userId);
    response.json(cart);
  } catch (error) {
    return next(error);
  }
});

router.post("/", async (request, response, next) => {
  try {
    let productData = request.body;
    await cartLogic.addToCart(productData);
    response.json();
  } catch (error) {
    return next(error);
  }
});

router.put("/", async (request, response, next) => {
  try {
    let productData = request.body;
    await cartLogic.updateAmountOnCart(productData);
    response.json();
  } catch (error) {
    return next(error);
  }
});

router.delete("/:cartId/:productId", async (request, response, next) => {
  try {
    let cartId = request.params.cartId;
    let productId = request.params.productId;
    await cartLogic.deleteFromCart(productId, cartId);
    response.json();
  } catch (error) {
    return next(error);
  }
});

router.post("/checkout", async (request, response, next) => {
  try {
    let userData = await cacheModule.extractUserDataFromCache(request);
    let userId = userData.userId;
    let userInfo = request.body;
    let cartDetails = await cartLogic.getCart(userId);
    await cartLogic.checkout(userId, cartDetails, userInfo);
    let orderId = await cartLogic.getOrderId(cartDetails);
    let path = `static/inovices/${orderId}.pdf`;
    await createInovice.newInvoice(orderId, userInfo, cartDetails, path);
    response.json(orderId);
  } catch (error) {
    return next(error);
  }
});

router.get("/totalOrder", async (request, response, next) => {
  try {
    let totalOrders = await cartLogic.getAllOrders();
    response.json(totalOrders);
    console.log(totalOrders);
  } catch (error) {
    return next(error);
  }
});



router.post("/download", async (request, response, next) => {
  try {
    let fileName = request.body.fileName;
    filePath = path.join(__dirname, "../static/inovices") +"/" + fileName + ".pdf";
    response.sendFile(filePath);
  } catch (error) {
    return next(error);
  }
});

router.get("/all-shippingDates", async (request, response, next) => {
  try {
    let unavilableDates = await cartLogic.getShippingDates();
    response.json(unavilableDates);
  } catch (error) {
    return next(error);
  }
});

module.exports = router;
