%dw 2.0
output application/json
---
 // requirement is to map the fields to required transformation. here id needs to map with respective links from payload and parent field need to add and the value must be id field from incoming payload//
                               
                                   // by using flatMap //
/*payload flatMap ((item, index) -> 
    (valuesOf(item filterObject ((value, key, index) -> (key startsWith  "link") and !isEmpty(value)))
    map{
        id: $,
        parent : item.Id,
        getdata: item.genData
    })
) */
                              // by using map and reduce function//
payload map ((item, index) -> 

 (valuesOf(item filterObject ((value, key, index) -> (key startsWith  "link") and !isEmpty(value) )))
    // valuesof was used here because the o/p has to transfer into arrays and need to maped// 
   map {
       id: $,
       parent: item.Id,
       getdata: item.genData
   }


) reduce($++$$) 