const express = require("express");

const authRouter = require("./auth");
const productRouter = require("./product");

const indexRouter = express.Router();

indexRouter.use("/auth", authRouter);
indexRouter.use("/", productRouter);

module.exports = indexRouter;
