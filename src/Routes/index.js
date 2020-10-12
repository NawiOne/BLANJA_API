const express = require("express");

const authRouter = require("./auth");
const productRouter = require("./product");
const transactionRouter = require("./transaction");

const indexRouter = express.Router();

indexRouter.use("/auth", authRouter);
indexRouter.use("/", productRouter);
indexRouter.use("/", transactionRouter);


module.exports = indexRouter;
