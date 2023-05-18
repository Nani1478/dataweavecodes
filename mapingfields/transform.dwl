%dw 2.0
output application/json
---
   // Requirement is to we ned to map fields in incoming payload.  in users we have number of users in user root our task is to we need to map these users to users as root and inised it name has to fomulate and need to assigen// 


  payload map ((item, index) -> 
    {
        "item_type": item.Item_Type,
        "users": item.Users splitBy  ";" map ((i, in) -> 
        
           "name":(i splitBy  "/")[0]
                // here i used [0] because we are getting array in that two names so need to take first value so i used [0]//
        
        )
    }
  
  
  
  
  )