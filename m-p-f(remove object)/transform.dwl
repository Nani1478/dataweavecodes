%dw 2.0
output application/json
---
//flatten(payload.data.orders.orderItems) filter ((item, index) -> !(item.productCode contains "FREE") ) //
// our requeriment is to filter out all the orderItems that have productCode containing "FREE"//
      //we need only products which  did not contain free//
{
    header: payload.header,
    data : orders : payload.data.orders map(
        $ mapObject ((value, key, index) -> 
        
            if(key as String == "orderItems")
            {  // here i am writing a condition to filter data from orderItems//
            (key):value filter ((item, index) -> !(item.productCode contains "FREE") )  // here we used ! it means it exclude free items//
         } else  (key):value
        )
    )
 
    
}