%dw 2.0
output application/json
import mergeWith from dw::core::Objects
var w = [{

"Address": "KyleMore Street USA",

"Country": "United Sates"

}]
---
// requirement is to merge two diffrent payloads are in arrays needs to combine and form,ulate as a single array of object containing all the kaeyvalue pairs in single object//
   
          // first method is by using Concatenatetion and reduce function//
//[(payload ++ w) reduce ((item, accumulator) -> accumulator ++ item )]
 
        // second way is to since it is array so by using map function and importing a  functions objects for using mergewith//

 /*payload map (
     $ mergeWith w[$$]
 )*/

        // third way is to using only map twice//

 payload map (item) ->

{                        // this 3ed code work dynamically it can merge multiple set of objects//
Name : item.Name,
Surname: item.Surname,
(w map (item1) -> {
Address : item1.Address,
Country:item1.Country
})
}