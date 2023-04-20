%dw 2.0
import * from dw::util::Values
import * from dw::core::Arrays
output application/json 
var timestamp = 1497263832000
---
//payload mask "code" with "******"//
//timestamp as  DateTime {unit: "milliseconds"} 

    //Flat map is Iterates over each item in an array and flattens the results//

payload flatMap ((item, index) -> item."Book Store Id" flatMap ({
    "BookStoreID": $      //entered into arry and maping the data//
} ++ {
       "RegrestedDate": item.RegrestedDate[indexOf(item."Book Store Id",$)] //by using concatenation we are addind required feald using index of book store asme operation done for all//
   } ++ {
       "Store Name": item.StoreName[indexOf(item."Book Store Id",$)]
   } ++ {
       "Store Address": item.StoreAddress [indexOf(item."Book Store Id",$)]
   } ++ {
        "Group To": item.GroupTo [indexOf(item."Book Store Id",$)]
   }))
         //aonter way of doing the code by using flatmap-map-mapobject//

  /* payload flatMap ((item, index)->
0 to sizeOf(item."Book Store Id")-1 map(    
item mapObject ((value, key, index) -> 
    (key) : value[$$] 
    )
))*/