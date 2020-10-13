const express = require("express");

const authRouter = require("./auth");

const userRouter = require("./user");

const productRouter = require("./product");
const transactionRouter = require("./transaction");


const indexRouter = express.Router();

indexRouter.use("/auth", authRouter);

indexRouter.use("/user", userRouter);

indexRouter.use("/", productRouter);
indexRouter.use("/", transactionRouter);


module.exports = indexRouter;
