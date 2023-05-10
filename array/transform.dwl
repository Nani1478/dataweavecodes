%dw 2.0
output application/json
---
 // the requirement is to add table fields to object and iterate over array and the data outside of the table is inserted as many times separately as there is objects within the Table array with key tablekey1//
    
             // first method//

/*payload flatMap ((item, index) -> item.Table  map{
    test1: item.test1,
    test2: item.test2,
    test3: item.test3,
    tablekey1: $.tablekey1

}

)*/

                 //second method//

           payload flatMap ((item, index) -> item.Table map (
     item filterObject ((value, key, index) -> key as String !="Table") ++ $
))