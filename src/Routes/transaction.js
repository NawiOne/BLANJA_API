const express = require("express");


const uploadImg = require("../Helpers/Middlewares/upload");

const transactionController = require("../Controllers/transaction");

const transactionRouter = express.Router();

transactionRouter.post("/transaction", transactionController.transaction);
transactionRouter.post("/addAddress", transactionController.newAddress);
transactionRouter.patch("/editAddress", transactionController.changeAddress);
transactionRouter.get("/Address", transactionController.getAddress);
transactionRouter.get("/history/seller", transactionController.getAllItemSeller);
transactionRouter.get("/history/customer", transactionController.getAllItemCustomer);

module.exports = transactionRouter;
