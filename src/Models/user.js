const db = require("../Configs/dbMySql");

const authModel = {
  getDataUser: (id) => {
    return new Promise((resolve, reject) => {
      const queryString =
        "SELECT users.id_user, users.username, users.level_id, users.email, users.phone_number, users.store_name, users.image, genders.gender, users.date_of_Birth, users.desc_store, users.address FROM users Join genders on users.gender_id = genders.id WHERE id_user = ?";
      db.query(queryString, [id], (err, data) => {
        if (!err) {
          resolve(data);
        } else {
          reject(err);
        }
      });
    });
  },
  updateDataUser: (body) => {
    const queryString = `UPDATE users SET ? WHERE id_user = ?`;
    return new Promise((resolve, reject) => {
      db.query(queryString, [body, body.id_user], (err, data) => {
        if (!err) {
          resolve({msg: 'Edit data user success'});
        } else {
          reject(err);
        }
      });
    });
  },
  updateUserImg: (body) => {
    const { id_user, image } = body;
    const queryString = "UPDATE users SET image= ? WHERE id_user = ?";
    return new Promise((resolve, reject) => {
      db.query(queryString, [image, id_user], (err, data) => {
        if (!err) {
          resolve(image);
        } else {
          reject(err);
        }
      });
    });
  },
};

module.exports = authModel;
