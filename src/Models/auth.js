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
                store_name: store_name,
                phone_number: phone_number,
                image: 'user.png',
              };
              const queryString = "INSERT INTO users SET ?";
              db.query(queryString, newBody, (err, data) => {
                if (!err) {
                  const payload = {
                    username: username,
                    password: hashedPassword,
                    level_id: level_id,
                  };
                  const token = jwt.sign(payload, process.env.SECRET_KEY, {
                    expiresIn: "6h",
                  });
                  const id_user = data.insertId;
                  const msg = "Register Success";
                  resolve({ msg, token, id_user, level_id });
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
          reject({ msg: "Wrong Password" });
        } else {
          bcrypt.compare(body.password, data[0].password, (err, result) => {
            if (result) {
              const { email } = body;
              const {
                id_user,
                level_id,
                password
              } = data[0];
              const payload = {
                email,
                password,
                level_id,
              };
              const token = jwt.sign(payload, process.env.SECRET_KEY, {
                expiresIn: "6h",
              });
              const msg = "Login Success";
              resolve({
                msg,
                token,
                id_user,
                level_id
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
      const qs = "SELECT email FROM users WHERE id_user = ?";
      db.query(qs, [body.id_user], (err, data) => {
        if (data.length) {
          bcrypt.genSalt(10, (err, salt) => {
            if (err) {
              reject(err);
            }
            const { password, id_user } = body;
            bcrypt.hash(password, salt, (err, hashedPassword) => {
              if (err) {
                reject(err);
              }
              const queryString =
                "UPDATE users SET password= ? WHERE id_user = ?";
              db.query(queryString, [hashedPassword, id_user], (err, data) => {
                if (!err) {
                  resolve({ msg: "change password success" });
                } else {
                  reject(err);
                }
              });
            });
          });
        } else {
          reject({msg: 'user not found'});
        }
      });
    });
  },
  sendEmail: (body) => {
    return new Promise((resolve, reject) => {
      const queryString = "SELECT id_user, email FROM users WHERE email = ?";
      db.query(queryString, [body.email], (err, data) => {
        if (err) {
          reject(err);
        }
        if (data.length) {
          const link = `http://localhost:3000/Confirmation-password?id_user=${data[0].id_user}`
          resolve({email: data[0].email, link: link })
        } else {
            reject({msg: 'data not found'});
        }
      });
    });
  },
};

module.exports = authModel;
