const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const db = require("../Configs/dbMySql");

const authModel = {
  postNewUser: (body) => {
    return new Promise((resolve, reject) => {
      const qs = "SELECT email FROM users WHERE email = ?";
      db.query(qs, [body.email], (err, data) => {
        if (data.length) {
          reject({ msg: "account is ready" });
        } else {
          bcrypt.genSalt(10, (err, salt) => {
            if (err) {
              reject(err);
            }
            const {
              password,
              email,
              phone_number,
              store_name,
              username,
              level_id,
            } = body;
            bcrypt.hash(password, salt, (err, hashedPassword) => {
              if (err) {
                reject(err);
              }
              const newBody = {
                username: username,
                level_id: level_id,
                email: email,
                password: hashedPassword,
              };
              const queryString = "INSERT INTO users SET ?";
              db.query(queryString, newBody, (err, data) => {
                if (!err) {
                  const newData = {
                    user_id: data.insertId,
                    phone_number: phone_number,
                    image_user: "user.png",
                    store_name: store_name,
                  };
                  const QS = "INSERT INTO user_detail SET ?";
                  db.query(QS, newData, (err, data) => {
                    if (!err) {
                      const payload = {
                        username: username,
                        password: hashedPassword,
                        level_id: level_id,
                      };
                      const token = jwt.sign(payload, process.env.SECRET_KEY, {
                        expiresIn: "6h",
                      });
                      const user_id = newData.user_id;
                      const msg = "Register Success";
                      resolve({ msg, token, user_id });
                    } else {
                      reject(err);
                    }
                  });
                  //   const payload = {
                  //     newBody,
                  //   };
                  //   const token = jwt.sign(payload, process.env.SECRET_KEY, {
                  //     expiresIn: "6h",
                  //   });
                  //   const id_user = data.insertId;
                  //   const msg = "Register Success";
                  //   resolve({ msg, token, id_user });
                } else {
                  reject(err);
                }
              });
            });
          });
        }
      });
    });
  },
  loginUser: (body) => {
    return new Promise((resolve, reject) => {
      const queryString = "SELECT * FROM users WHERE email = ?";
      db.query(queryString, [body.email], (err, data) => {
        if (err) {
          reject(err);
        }
        if (!data.length) {
          reject("User Not Found");
        } else {
          bcrypt.compare(body.password, data[0].password, (err, result) => {
            if (result) {
              const { email } = body;
              const {
                id_user,
                password,
                username,
                image,
                pin,
                no_hp,
                amount,
              } = data[0];
              const payload = {
                email,
                password,
              };
              const token = jwt.sign(payload, process.env.SECRET_KEY, {
                expiresIn: "6h",
              });
              const msg = "Login Success";
              resolve({
                msg,
                token,
                id_user,
                username,
                image,
                pin,
                no_hp,
                amount,
                email,
              });
            }
            if (!result) {
              reject({ msg: "Wrong Password" });
            }
            if (err) {
              reject(err);
            }
          });
        }
      });
    });
  },
  changePassword: (body) => {
    return new Promise((resolve, reject) => {
      const qs = "SELECT email FROM users WHERE email = ?";
      db.query(qs, [body.email], (err, data) => {
        if (data.length) {
          bcrypt.genSalt(10, (err, salt) => {
            if (err) {
              reject(err);
            }
            const { password, email } = body;
            bcrypt.hash(password, salt, (err, hashedPassword) => {
              if (err) {
                reject(err);
              }
              const queryString =
                "UPDATE users SET password= ? WHERE email = ?";
              db.query(queryString, [hashedPassword, email], (err, data) => {
                if (!err) {
                  resolve({ msg: "change password success" });
                } else {
                  reject(err);
                }
              });
            });
          });
        } else {
          reject(err);
        }
      });
    });
  },
  sendEmail: (body) => {
    return new Promise((resolve, reject) => {
      const otp = Math.floor(1000 + Math.random() * 900000);
      const queryString = "SELECT email, code FROM code_otp WHERE email = ?";
      db.query(queryString, [body.email], (err, data) => {
        if (err) {
          reject(err);
        }
        if (data.length) {
          const Qs = `UPDATE code_otp SET code = ${otp} Where email = ? `;
          db.query(Qs, [body.email], (err, data) => {
            if (!err) {
              resolve({ sendOTP: "success", code: otp });
            } else {
              reject(err);
            }
          });
        } else {
          const Qstr = `INSERT INTO code_otp SET email = ?, code= ?`;
          db.query(Qstr, [body.email, otp], (err, data) => {
            if (!err) {
              resolve({ sendOTP: "success", code: otp });
            } else {
              reject(err);
            }
          });
        }
      });
    });
  },
};

module.exports = authModel;
