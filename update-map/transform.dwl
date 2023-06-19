%dw 2.0
output application/json
---
// here the requirement is to we have products and price in two different arrays so wee need to add  price to products and formulate a new transformed output//
// payload.products map {
//     id: $.id,
//     'type': $."type",
//     price: (payload.price filter ((item, index) -> item.id ~= $.id )).cost reduce ($)
// }

(payload  update {
    case .products -> $ map ((item, index) -> 
    {
        id: item.id,
        'type': item."type",
        price: (payload.price filter ((i, in) -> i.id ~= item.id )).cost reduce ($ )
    }
    
    )
}) - "price"
/*
[
 {
 "id": "5001",
 "type": "None",
 "price": 2
 },
 {
 "id": "5002",
 "type": "Glazed",
 "price": null
 },
 {
 "id": "5005",
 "type": "Sugar",
 "price": 5
 },
 {
 "id": "5007",
 "type": "Powdered Sugar",
 "price": ""
 },
 {
 "id": "5006",
 "type": "Chocolate with Sprinkles",
 "price": null
 },
 {
 "id": "5003",
 "type": "Chocolate",
 "price": null
 },
 {
 "id": "5004",
 "type": "Maple",
 "price": 6
 }
]
*/