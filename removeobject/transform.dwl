%dw 2.0
output application/json
---
// here the requirement is to need to remove objects that contains name field as empty or null in the array  at the same time need to modify the in coming payload  as ids have to formulate in an array with ids as root//
 payload filter ((item, index) -> item.Name != "" ) map(

      {
          name: $.Name,
          "id's": $ pluck ((value, key, index) ->
           (id: value) if ((key as String) contains  "id") 
                
           )filter ((item, index) -> item != {} )
      }  

 )