const express = require("express");
const router = express.Router();
const productsLogic = require("../logic/products-logic");
const cacheModule = require("../logic/cache-module");

router.get("/", async (request, response, next) => {
  try {
    let products = await productsLogic.getAllProducts();
    response.json(products);
    console.log(products);
  } catch (error) {
    return next(error);
  }
});

router.put("/", async (request, response, next) => {
  try {
    let newProductDetails = request.body;
    await productsLogic.editProduct(newProductDetails);
    console.log("product Updated!");
    response.json();
  } catch (error) {
    return next(error);
  }
});

router.post("/", async (request, response, next) => {
  try {
    let newProduct = request.body;
    await productsLogic.addNewProduct(newProduct);
    response.json();
  } catch (error) {
    return next(error);
  }
});

module.exports = router;
