
const db = require("../Configs/dbMySql");

const transactionModel = {
 transaction:(body)=>{
     const {id, customer_id, seller_id, address, amount, payment, product} = body
     return new Promise((resolve, reject)=>{
         const qs = `INSERT INTO transaction SET customer_id=?, seller_id=?, address=?, amount=?, payment=?, date= NOW();
         INSERT INTO trans_item (transaction_id, product_id, color, size, qty) VALUES?`
         const query = product.map(item =>{
             return [id, item.product_id, item.color, item.size, item.qty]
         })
         console.log(query)
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
     getAllItemSeller:(query)=>{
        return new Promise((resolve, reject)=>{
            const qs = `SELECT products.name_product, products.brand, products.price, products.image, trans_item.color, trans_item.size, trans_item.qty FROM products JOIN trans_item ON product.id = trans_item.product_id JOIN transaction ON  WHERE transaction.seller_id = ${query.seller_id}`
           db.query(qs, (err, data)=>{
               if(err){
                   reject(err)
               }else{
                   resolve(data)
               }
           })
        })     
    },
};

module.exports = transactionModel;
