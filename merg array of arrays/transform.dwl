%dw 2.0
output application/json
---
  // here the requirement is to records has to merge and formlate as a single array of objects and map with required fields i.e we need only is success, errormsg, tranid, records records must contain all the records data i.e two arrays data in single array//
payload map(
    {
        "isSuccess": $.isSuccess,
        "errorMessage": $.errorMessage,
        "TransId" : $.TransId,
        "records": flatten($.*records)
    }
) 