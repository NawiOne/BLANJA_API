const formResponse = require("../Helpers/forms/formResponse");
const authModel = require("../Models/auth");
const nodemailer = require("nodemailer");

const authController = {
  register: (req, res) => {
    authModel
      .postNewUser(req.body)
      .then((data) => {
        formResponse.succes(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  login: (req, res) => {
    authModel
      .loginUser(req.body)
      .then((data) => {
        formResponse.succes(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  changePassword: (req, res) => {
    authModel
      .changePassword(req.body)
      .then((data) => {
        formResponse.succes(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  sendEmail: (req, res) => {
    authModel
      .sendEmail(req.body)
      .then((data) => {
        var transporter = nodemailer.createTransport({
          service: "gmail",
          auth: {
            user: "blanjaarkademy@gmail.com",
            pass: "Blanja2020",
          },
        });

        var mailOptions = {
          from: "blanjaarkademy@gmail.com",
          to: data.email,
          subject: "Reset Password",
          text: `Link to reset password : ${data.link}`,
        };

        transporter.sendMail(mailOptions, function (error, info) {
          if (error) {
            console.log(error);
          } else {
            console.log("Email sent: " + info.response);
          }
        });
        formResponse.succes(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
};

module.exports = authController;
