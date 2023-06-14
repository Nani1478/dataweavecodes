%dw 2.0
output application/json
---
// here the requirement is  we need to convert value to upper case //

payload  update {
    case ."Document Type" -> $ map ((item, index) ->upper(item) )
}

// payload mapObject ((value, key, index) -> (key): value map ((item, index) -> upper(item) ) )
