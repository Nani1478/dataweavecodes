%dw 2.0
output application/json
---
  // here the requirement is to we have roles in i/p containing only values we need to add a key for that value//
    // at the same time no other fields will not get effected//
    
payload  update {
    case .value-> $  map ((item, index) -> item mapObject ((value, key, index) ->
    
       if (key ~= "roles")
       {
           ((key): value map( "values": $)reduce ($++$$))
       } else (key): value
    
     ) )
}