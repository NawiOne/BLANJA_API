
const db = require("../Configs/dbMySql");

const productModel = {
 uploadProduct:(body)=>{
     const {name_product, brand, price, stock, product_condition, image,description, category} = body
     return new Promise((resolve, reject)=>{
         const qs = `INSERT INTO products SET name_product =?, brand=? price=?, stock=? , product_condition=?, image=?, category=?, description=?, upload_at= NOW()`
        db.query(qs, [name_product, brand, price, stock, product_condition, image, category, description], (err, data)=>{
            if(err){
                reject(err)
            }else{
                resolve(data)
                console.log(data)
            }
        })
     })     
     },
     getNewProduct:(query)=>{
         const page = query.page
         const limit = query.limit
         const offset = (page - 1)*limit
        return new Promise((resolve, reject)=>{
            const qs = `SELECT  name_product , price, brand, image FROM products ORDER BY upload_at DESC LIMIT ? OFFSET ?`
           db.query(qs, [Number(limit), offset], (err, data)=>{
               if(err){
                   reject(err)
               }else{
                   resolve(data)
               }
           })
        })     
    },
    getPopularProduct:()=>{
        return new Promise((resolve, reject)=>{
            const qs = `SELECT  name_product , price, brand, image FROM products JOIN trans_item ON products.id = trans_item.product_id ORDER BY SUM(product_id) DESC`
           db.query(qs, (err, data)=>{
               if(err){
                   reject(err)
               }else{
                   resolve(data)
               }
           })
        })     
    },
    getProductByCategory:(query)=>{
        return new Promise((resolve, reject)=>{
            const qs = `SELECT name_product, price, brand, image FROM products WHERE category LIKE '%${query.category}%'`
            console.log(query.category)
           db.query(qs, (err, data)=>{
               if(err){
                   reject(err)
               }else{
                   resolve(data)
               }
           })
        })     
    },
    searchProduct:(query)=>{
        return new Promise((resolve, reject)=>{
            const qs = `SELECT name_product, price, brand, image FROM products WHERE name_product LIKE '%${query.search}%' ORDER BY price ${query.filter}`
           db.query(qs, (err, data)=>{
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
            const qs = `SELECT name_product, brand, price, image, color, product_condition, description FROM products WHERE product_id = ${query.product_id}`
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

module.exports = productModel;
