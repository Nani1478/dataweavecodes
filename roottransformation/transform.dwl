%dw 2.0
output application/json
---
// here the requirement is to we have array od multipel objects with same roots. so task is to each root containing objects has to forms as a singele object and formulate as a new transformed object//


           //method-1//
// payload.data map ((item, index) -> item.Name map (
//     "Name": $
//   ) reduce ($$++$))
        
        //method-2//
// payload.data map {
//   ($)
// }

       //method-3//
 payload.data map ((item) -> {
 (item)
 })