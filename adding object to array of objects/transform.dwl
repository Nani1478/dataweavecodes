%dw 2.0
import * from dw::core::Arrays
output application/json
var n =   {
             "id":"222_1",
             "consentFlag":"true",
             "type":"information"
          }
 var index = (payload indexWhere ((item) -> item.consentFlag == "true")) + 1
     // i have created a variable for identifing the "consentFlag" is true and which index it is falls under// 
---
 // requirement is to we have payload as well as a variable. in payload a unique key "consentFlag" if it is true then the object which is stored in variable need to add below the existing object//  

        // in this method just adding an object to array of objects  but required condetion is not satisfied//
        
//(payload + n) orderBy ((item, index) -> item.id)
        // in this method i have used both variables and payload and achived//
        
 flatten(payload[0 to index - 1] + n + payload[index to -1])