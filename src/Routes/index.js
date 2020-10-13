const express = require("express");

const authRouter = require("./auth");
const userRouter = require("./user");

const indexRouter = express.Router();

indexRouter.use("/auth", authRouter);
indexRouter.use("/user", userRouter);

module.exports = indexRouter;
