const express = require("express");


const uploadImg = require("../Helpers/Middlewares/upload");

const transactionController = require("../Controllers/transaction");

const transactionRouter = express.Router();

transactionRouter.post("/transaction", transactionController.transaction);
transactionRouter.patch("/addAddress", transactionController.addAddress);

module.exports = transactionRouter;
