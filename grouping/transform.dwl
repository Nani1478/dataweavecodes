%dw 2.0
output application/json
---
 // here the requirement is to we have a set of data in that frist need to group fileds based on itemabc then need sum of those group containing AVGUSG//
 
payload.result groupBy ((item, index) ->  item.itemABC) mapObject ((value, key, index) -> (key): sum(value map ((i, in) -> (i.AvgUsg as Number) ) ))