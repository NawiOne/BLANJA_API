
const db = require("../Configs/dbMySql");

const transactionModel = {
 transaction:(body)=>{
     const {invoice, customer_id, seller_id, address, amount, payment, product} = body
     return new Promise((resolve, reject)=>{
         const qs = `INSERT INTO transaction SET invoice=?, customer_id=?, seller_id=?, address=?, amount=?, payment=?, date= NOW();
         INSERT INTO trans_item (invoice_id, product_id, color, size, qty) VALUES?`
         const query = product.map(item =>{
             return [invoice, item.product_id, item.color, item.size, item.qty]
         })
         console.log(query)
        db.query(qs, [invoice,customer_id, seller_id, address, amount, payment, query], (err, data)=>{
            if(!err){
                resolve(data)
            }else{
                reject(err)
            }
        })
     })     
     },
    changeAddress:(body, query)=>{
        const {save_address, receipt_name, telephone_number, address, postal_code, city_or_subdistric, user_id, id_address} = body
     return new Promise((resolve, reject)=>{
         const qs = `UPDATE address_tb SET save_address=?, receipt_name=?, telephone_number=?, address=?, postal_code=?, city_or_subdistric=? WHERE user_id=${query.user_id} AND id_address=${query.id_address}`
        db.query(qs, [save_address, receipt_name, telephone_number, address, postal_code, city_or_subdistric], (err, data)=>{
            if(err){
                reject(err)
            }else{
                resolve(data)
                console.log(data)
            }
        })
     })     
     },
     newAddress:(body)=>{
        const {save_address, receipt_name, telephone_number, address, postal_code, city_or_subdistric, user_id} = body
     return new Promise((resolve, reject)=>{
         const qs = `INSERT INTO address_tb SET save_address=?, receipt_name=?, telephone_number=?, address=?, postal_code=?, city_or_subdistric=?, user_id=? `
        db.query(qs, [save_address, receipt_name, telephone_number, address, postal_code, city_or_subdistric, user_id], (err, data)=>{
            if(err){
                reject(err)
            }else{
                resolve(data)
            }
        })
     })     
     },
     getAddress:(query)=>{
     return new Promise((resolve, reject)=>{
         const qs = `SELECT id_address, save_address, receipt_name, telephone_number, address, postal_code, city_or_subdistric FROM address_tb WHERE user_id= ${query.user_id} `
        db.query(qs,  (err, data)=>{
            if(err){
                reject(err)
            }else{
                resolve(data)
               
            }
        })
     })     
     },
     getAllItemSeller:(query)=>{
        return new Promise((resolve, reject)=>{
            const qs = `SELECT  products.name_product, products.brand, products.price, products.image, trans_item.color, trans_item.size, trans_item.qty FROM products JOIN trans_item ON products.id = trans_item.product_id JOIN transaction ON trans_item.invoice_id = transaction.invoice  WHERE transaction.seller_id = ${query.id}`
           db.query(qs, (err, data)=>{
               if(err){
                   reject(err)
               }else{
                   resolve(data)
               }
           })
        })     
    },
    getAllItemCustomer:(query)=>{
        return new Promise((resolve, reject)=>{
            const qs = `SELECT products.name_product, products.brand, products.price, products.image, trans_item.color, trans_item.size, trans_item.qty FROM products JOIN trans_item ON products.id = trans_item.product_id JOIN transaction ON trans_item.invoice_id = transaction.invoice  WHERE transaction.customer_id = ${query.id}`
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
