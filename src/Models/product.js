
const db = require("../Configs/dbMySql");

const productModel = {
 uploadProduct:(body)=>{
     return new Promise((resolve, reject)=>{
         const qs = `INSERT INTO products SET ?`
        db.query(qs, [body], (err, data)=>{
            if(err){
                reject(err)
            }else{
                resolve(data)
            }
        })
     })     
     },
     getNewProduct:(query)=>{
         const page = query.page
         const limit = query.limit
         const offset = (page - 1)*limit
        return new Promise((resolve, reject)=>{
            const qs = `SELECT  id, seller_id, name_product , price, brand, image FROM products ORDER BY upload_at DESC `
           db.query(qs, [Number(limit), offset], (err, data)=>{
               if(err){
                   reject(err)
               }else{
                   resolve(data)
               }
           })
        })     
    },
    getPopularProduct:(query)=>{
        const page = query.page
        const limit = query.limit
        const offset = (page - 1)*limit
        return new Promise((resolve, reject)=>{
           const qs =`SELECT id, seller_id, products.name_product, products.brand, products.price, products.image FROM products JOIN trans_item ON products.id = trans_item.product_id GROUP BY trans_item.product_id ORDER BY SUM(trans_item.qty) DESC`
           db.query(qs, [Number(limit), offset],(err, data)=>{
               if(err){
                   reject(err)
               }else{
                   resolve(data)
               }
           })
        })     
    },
    getProductByCategory:(query)=>{
        const page = query.page
        const limit = query.limit
        const offset = (page - 1)*limit
        return new Promise((resolve, reject)=>{
            const qs = `SELECT id, seller_id, name_product, price, brand, image FROM products WHERE category LIKE '%${query.category}%' LIMIT ? OFFSET ?`
           db.query(qs, [Number(limit), offset],(err, data)=>{
               if(err){
                   reject(err)
               }else{
                   resolve(data)
               }
           })
        })     
    },
    searchProduct:(query)=>{
        const page = query.page
        const limit = query.limit
        const offset = (page - 1)*limit
        return new Promise((resolve, reject)=>{
            const qs = `SELECT id, seller_id, name_product, price, brand, image FROM products WHERE name_product LIKE '%${query.search}%' OR brand LIKE '%${query.search}%' ORDER BY price ${query.filter} LIMIT ? OFFSET ?`
           db.query(qs, [Number(limit), offset], (err, data)=>{
               if(err){
                   reject(err)
               }else{
                   resolve(data)
               }
           })
        })     
    },
    getProductDetail:(query)=>{
        return new Promise((resolve, reject)=>{
            const qs = `SELECT id, seller_id, name_product, brand, price, image, color, product_condition, description FROM products WHERE id = ${query.id}`
           db.query(qs, (err, data)=>{
               if(err){
                   reject(err)
               }else{
                   resolve(data)
               }
           })
        })     
    },
    getSellerProduct:(query)=>{
        const page = query.page
        const limit = query.limit
        const offset = (page - 1)*limit
       return new Promise((resolve, reject)=>{
           const qs = `SELECT  id, seller_id, name_product , price, brand, image FROM products WHERE seller_id= ${query.seller_id} ORDER BY price DESC LIMIT ? OFFSET ?`
          db.query(qs, [Number(limit), offset], (err, data)=>{
              if(err){
                  reject(err)
              }else{
                  resolve(data)
              }
          })
       })     
   },


};

module.exports = productModel;
