const express = require("express");


const uploadImg = require("../Helpers/Middlewares/upload");

const productController = require("../Controllers/product");

const productRouter = express.Router();

productRouter.post("/product", uploadImg.multipleUpload, productController.uploadProduct);
productRouter.get("/product/new", productController.getNewProduct);
productRouter.get("/product/popular", productController.getPopularProduct);
productRouter.get("/product/category", productController.getProductByCategory);
productRouter.get("/product/detail", productController.getProductDetail);
productRouter.get("/product", productController.searchProduct);
productRouter.get("/product/popular", productController.getPopularProduct);

module.exports = productRouter;
