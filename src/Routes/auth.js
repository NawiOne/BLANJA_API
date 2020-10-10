const express = require("express");

// const menusController = require("../Controllers/menus");
// const uploadImg = require("../Helpers/Middlewares/upload");

const authController = require("../Controllers/auth");

const authRouter = express.Router();

authRouter.post("/register", authController.register);
authRouter.post("/login", authController.login);

module.exports = authRouter;
