const formResponse = require("../Helpers/forms/formResponse");
const productModel = require("../Models/product");


const productController = {
  uploadProduct: (req, res) => {
    productModel
      .uploadProduct(req.body)
      .then((data) => {
        const responData={
          ...req.body,
          msg:'Upload Product Success'
        }
        formResponse.succes(res, responData);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  getNewProduct: (req, res) => {
    productModel
      .getNewProduct(req.query)
      .then((data) => {
        formResponse.pagination(req, res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  getPopularProduct: (req, res) => {
    productModel
      .getPopularProduct()
      .then((data) => {
        formResponse.succes(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  getProductByCategory: (req, res) => {
    productModel
      .getProductByCategory(req.query)
      .then((data) => {
        formResponse.succes(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  getProductDetail: (req, res) => {
    productModel
      .getProductDetail(req.query)
      .then((data) => {
        formResponse.succes(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  searchProduct: (req, res) => {
    productModel
      .searchProduct(req.query)
      .then((data) => {
        formResponse.succes(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
};

module.exports = productController;
