%dw 2.0
output application/json
---
 // here the rrquirement is to if any value in the in coming payload is empty i.e "" or null in that case we need to assigen a value for that i.e any field in this case i used Kafka Attribute Name as a adding name//
payload map ((item, index) -> 
   item mapObject ((value, key, index) -> 
   
   (key): if(value == "" or value == null)
                    item."Kafka Attribute Name"
          else  value
   
   )


)