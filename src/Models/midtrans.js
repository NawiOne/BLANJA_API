const midtransClient = require('midtrans-client')
require("dotenv").config();

let core = new midtransClient.CoreApi({
    isProduction : false,
    serverKey : process.env.YOUR_SERVER_KEY,
    clientKey : process.env.YOUR_CLIENT_KEY 
});

// satu endpoint dibikin dua 

let parameter = {
    "payment_type": "gopay",
    "transaction_details": {
        "gross_amount": 12145,
        "order_id": "test-transaction-54321",
    },
    "gopay": {
        "enable_callback": true,                // optional
        "callback_url": "someapps://callback"   // optional
    },
    "item_details": [{
      "id": "ITEM1",
      "price": 10000,
      "quantity": 1,
      "name": "Midtrans Bear",
      "brand": "Midtrans",
      "category": "Toys",
      "merchant_name": "Midtrans"
  }],
};
core.charge(parameter)
.then((chargeResponse)=>{
  console.log('chargeResponse:');
  console.log(chargeResponse);
});