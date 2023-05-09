%dw 2.0
output application/json
---

//  the requirement is to we need to transform the dat into objects that contains data and id as fields//
  

flatten(payload map ((item, index) -> (item.objects map ((item2, index2) -> {
"data": item2.data,
"id": item.id
}))))

 
//since it is in array used map comming to mapping fields we have another object so again i used map to transform fields//