%dw 2.0
output application/json
---
// requerimet is to Based on DaysBetween number  if days between is 2 then that object has to  print two times with  "TENANTUNIQUENAME" and "LAST_UPDATE". here  "LAST_UPDATE" needs to convert into readable.//

payload flatMap ((i, ix) -> // here thenlogic is to we need to iterate based on DaysBetween number so i am maping from 1 to date field value so it will iterate and based on that we can map the required fields//

 (1 to i.DaysBetween) map ((item, index) ->
 
 {
     TENANTUNIQUENAME: i.TENANTUNIQUENAME,
     "LAST_UPDATE" : i.LAST_UPDATE as DateTime {unit: "milliseconds"} as Date {formate: "yyy-mm-dd"}
 }
   ) // we gr array of array ao ofjects to over come this we  can use flatten or else we can use flatMap at the starting//
 )