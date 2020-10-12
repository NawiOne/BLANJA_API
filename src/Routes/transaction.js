const express = require("express");


const uploadImg = require("../Helpers/Middlewares/upload");

const transactionController = require("../Controllers/transaction");

const transactionRouter = express.Router();

transactionRouter.post("/transaction", transactionController.transaction);

module.exports = transactionRouter;
