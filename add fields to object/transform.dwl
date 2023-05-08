%dw 2.0
output application/json
---
// requirement is to add Task fields to  object( merg with project fields) and formulate as a single object for a particular task id//

  payload mapObject ((value, key, index) -> 
   if(key ~= "Project")
   {
        (key): payload.Project flatMap ((item, index) -> item.Task map ( item - "Task" ++ $))
               // we have array of arrays here so i used flat map to formulate as a single array and while maping we find tas is again add to object so remove this just used "-" so we get desired o/p//

   } else (key): value
  
  
  )