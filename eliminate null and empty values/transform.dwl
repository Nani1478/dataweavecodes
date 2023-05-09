%dw 2.0
output application/json
---
  // Requirement is to  eliminate empty strings aswell as null values from entire paload//

              // first approch//

//payload map ((item, index) -> (item filterObject ((value, key, index) -> (value != ""))))
   
             // second approch//

//payload map ((item, index) -> (item filterObject ((value, key, index) -> (!isEmpty(value)))))
   
             // third approch// 
             
payload map ((item, index) -> item mapObject ((value, key, index) ->
          (if (value != null and value != "")
      {
        (lower(key)) : value
      }
    else {}
      )))