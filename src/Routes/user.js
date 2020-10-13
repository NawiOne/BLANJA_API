const express = require("express");

// const menusController = require("../Controllers/menus");
const uploadImg = require("../Helpers/Middlewares/upload");

const userController = require("../Controllers/user");

const userRouter = express.Router();

userRouter.get("/:id", userController.getDataUser);
userRouter.patch("/", uploadImg.singleUpload, userController.updateDataUser);


module.exports = userRouter;
