const formResponse = require("../Helpers/forms/formResponse");
const userModel = require("../Models/user");

const userController = {
  getDataUser: (req, res) => {
    userModel
      .getDataUser(req.params.id)
      .then((data) => {
        formResponse.succes(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  updateDataUser: (req, res) => {
    userModel
      .updateDataUser(req.body)
      .then((data) => {
        formResponse.succes(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
};

module.exports = userController;
