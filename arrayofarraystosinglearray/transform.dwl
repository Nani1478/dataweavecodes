%dw 2.0
output application/json
---
// heree the requirement is to we have array of arrays with different objects from those we need to transform train, hotel and price(train ticket price + hotel price)

(payload[0] flatMap ((train, index) -> 
 
   payload[1] map ((hotel, index) -> {
        "train": train.train,
        "hotel": hotel.hotel,   
        "price" : train.price + hotel.price
   }
   )
))