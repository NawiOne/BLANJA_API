const formResponse = require("../Helpers/forms/formResponse");
const transactionModel = require("../Models/transaction");


const transactionController = {
  transaction: (req, res) => {
    transactionModel
      .transaction(req.body)
      .then((data) => {
        const responData={
          ...req.body,
          msg:'Transaction Success'
        }
        formResponse.succes(res, responData);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
};

module.exports = transactionController;
