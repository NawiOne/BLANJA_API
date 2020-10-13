
const db = require("../Configs/dbMySql");

const transactionModel = {
 transaction:(body)=>{
     const {customer_id, seller_id, address, amount, payment, product} = body
     return new Promise((resolve, reject)=>{
        // resolve(body)
         const qs = `INSERT INTO transaction SET customer_id=?, seller_id=?, address=?, amount=?, payment=?, date= NOW();INSERT INTO trans_item (LAST_INSERT_ID(), product_id, color, size, qty) VALUES=? `
         const query = product.map(item =>{
             return [LAST_INSERT_ID(), item.product_id, item.color, item.size, item.qty]
         })
        //  console.log(body)
        db.query(qs, [customer_id, seller_id, address, amount, payment, query], (err, data)=>{
           
            if(!err){
                resolve(data)
            }else{
                reject(err)
               
            }
        })
     })     
     },
    addAddress:(body)=>{
        const {save_address, receipt_name, telephone_number, address, postal_code, city_or_subdistric, user_id} = body
     return new Promise((resolve, reject)=>{
        // resolve(body)
         const qs = `UPDATE address_tb SET save_address=?, receipt_name=?, telephone_number=?, address=?, postal_code=?, city_or_subdistric=? WHERE user_id=?`
        db.query(qs, [save_address, receipt_name, telephone_number, address, postal_code, city_or_subdistric, user_id], (err, data)=>{
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
