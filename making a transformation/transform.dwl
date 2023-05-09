%dw 2.0
output application/json
var x = [
  {
    "Id": "0YW3H0000004Ds0000",
    "type": "blue",
    "Deductible": true
  },
  {
    "Id": "0YW3H0000004Ds0000",
    "type": "red",
    "Deductible": true
  },
  {
    "Id": "0YW3H0000004EksWAE",
    "type": "purple",
    "Deductible": true
  },
  {
    "Id": "0YW3H0000004EllWAE",
    "type": "yellow",
    "Deductible": true
  },
  {
    "Id": "0YW3H0000004EllWAE",
    "type": "black",
    "Deductible": false
  }
]
var a= x groupBy ($.Id) mapObject ((value, key, index) -> (key): value map ( $ - "Id"))
---
   // Here the requirement is to compare two payloads and based on matching id filed we need to add item field in main payload with items as root//
         // for that first i grouped second payload based on id  field so that i get id as root with respect to their key values// 
payload map(
    $ ++ if ( a [$.Id]?) {items: a [$.Id]} else {}
     // heree ? checkes the condition wetgher the value and key are present or ont if present then it add the item else adds empty 
            
)
