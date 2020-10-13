const formResponse = require("../Helpers/forms/formResponse");
const transactionModel = require("../Models/transaction");


const transactionController = {
  transaction: (req, res) => {
    transactionModel
      .transaction(req.body)
      .then((data) => {
        const responData={
          ...req.body,
          id:data.insertId,
          msg:'Transaction Success'
        }
        formResponse.succes(res, responData);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  addAddress: (req, res) => {
    transactionModel
      .addAddress(req.body)
      .then((data) => {
        const responData={
          ...req.body,
          msg:'add Address Success'
        }
        formResponse.succes(res, responData);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  getAllItemSeller: (req, res) => {
    transactionModel
      .getAllItemSeller(req.query)
      .then((data) => {
        formResponse.succes(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
};

module.exports = transactionController;
