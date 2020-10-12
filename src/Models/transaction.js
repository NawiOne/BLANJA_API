
const db = require("../Configs/dbMySql");

const transactionModel = {
 transaction:(body)=>{
     const {customer_id, seller_id, address, qty, product_id, amount, color, size} = body
     return new Promise((resolve, reject)=>{
         const qs = `INSERT INTO transaction SET customer_id=?, seller_id=?, address=?, product_id=?, color=?, size=?, qty=? , amount=?, date= NOW()`
        db.query(qs, [customer_id, seller_id, address,  product_id, color, size, qty, amount], (err, data)=>{
            if(err){
                reject(err)
            }else{
                resolve(data)
                console.log(data)
            }
        })
     })     
     },
    
    


};

module.exports = transactionModel;
