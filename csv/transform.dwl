%dw 2.0
output application/json
---
// here the requirement is to we have CSV input in that x10,x16,x20 by using these we need to transform data rules have to follow Need to create a new column i.e NewColumn in output csv  and If the data exists in multiple X* colmuns then need to add those number of rows and update NewColumn with each X* value and if data exists in only one X* colmun then copy the X* field value into NewColumn and  if there is no data in X* colmuns then we need add NoSub in NewColumn//

 (payload flatMap {
         id: $.Id,
         name: $.Name,
         ID__c: $.ID__c,
         x10: $.X10,
         x16: $.X16,
         x20: $.X20,
         NewColumn: (if ($.X10 == "" and $.X16 == "" and $.X20 == "") "NoSub" else $.X10 ++ $.X16 ++ $.X20)   
      
 } filter ((item, index) -> item.NewColumn != "" )) distinctBy ($ )