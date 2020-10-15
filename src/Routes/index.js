const express = require("express");


const productRouter = require("./product");
const transactionRouter = require("./transaction");

const indexRouter = express.Router();


indexRouter.use("/", productRouter);
indexRouter.use("/", transactionRouter);


module.exports = indexRouter;
