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
  changeAddress: (req, res) => {
    transactionModel
      .changeAddress(req.body, req.query)
      .then((data) => {
        const responData={
          ...req.body,
          msg:'update Address Success'
        }
        formResponse.succes(res, responData);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  newAddress: (req, res) => {
    transactionModel
      .newAddress(req.body)
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
  getAddress: (req, res) => {
    transactionModel
      .getAddress(req.query)
      .then((data) => {
        formResponse.succes(res, data);
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
  getAllItemCustomer: (req, res) => {
    transactionModel
      .getAllItemCustomer(req.query)
      .then((data) => {
        formResponse.succes(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
};

module.exports = transactionController;
