%dw 2.0
import * from dw::core::Strings
output application/json
---
 // here the requirement is to  we have a payload in that some fields containg null values so we need to remove those objects from payload. and we need to multiply formattedvalue with 1.15 at the same time we need to limit desimils up to two digits only//

                // first method//
// payload filter ((item, index) -> item.value != null and item.formattedValue != null ) map ((i, in) -> i  update {
//     case .formattedValue-> "\$" ++ ((substringAfter($,"\$") * 1.15) as String{format: "0.00"})
// }
//  )
           // second method//

payload filter ($.value != null ) map ((item, index) -> item mapObject ((value, key, index) ->
     if(key ~= "formattedValue" )
     {
         (key): "\$"++ ((substringAfter(value,"\$") * 1.15)  as String{format: "0.00"})

     } else (key): value

 )

 )