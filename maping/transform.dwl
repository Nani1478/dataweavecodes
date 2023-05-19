%dw 2.0
output application/json
---
  // here the requirement is to  we have array of locations and an employ out side the arry.
   // task is to for each location employee need to add for entire array set. //
payload flatMap ((item, index) -> item.territory map ( 
      

{
    territory : $,
    employee: item.employee
}


)

 ) // by using map i am getting array of arrays to over come this i used flatMap instad we can use reduce function also at the end//