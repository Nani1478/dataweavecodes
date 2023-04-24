%dw 2.0
output application/xml writeDeclaration = false  /* we are removing "<?xml version='1.0' encoding='UTF-8'?>" by keping false if it is true it will show the hedder*/
---
//in requirement they are asking about how to iterate into a sope message, unlike json message soap is different XML has various datatypes and it supports attributes// 


// for that  i am using filter because we have multiple field names with different values so based on values i am filter the soam message.//
 
 
index: (payload.Document.*Field filter ((item, index) -> item.@name contains  "dpTriggerField"))
                                                         // since filed name is in attributes we are not supposed to access directly so we have to use @ to call attributes in XML//