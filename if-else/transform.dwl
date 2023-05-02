%dw 2.0
output application/json
---
 // here the requirement is generate more than 1 JSON in a If else condition, And i Want if the field FreeGood is >0 or != null generate two json (key value pairs) in other case, only one.//
    
payload map { //since it is in array so used map function//
    "name": $.Name,
    "Apellidos" : $.Apellidos,
    "CASAS" : ( $.CASAS map ((item, index) -> 
    
     if(item.FreeGood != null and item.FreeGood > 0) 0 to 1 map // here the logic is we need to check  FreeGood value is thet null or any integer based on thet we have to build logic//
     {
         "CASAS": item.Calle // for that i used if elese condition  if FreeGood is null or grater then 0 we need to add one more value or else it has to be prist as usual//
     } else {
         "CASAS": item.Calle
     }
    
    
    
    )) flatMap ((item, index) -> item ) // we get array of arrays containg objects but it is not requirement to eliminate this i am using flatmap array of arrays containg objects to a single array containg objects//
}