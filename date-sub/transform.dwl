%dw 2.0
output application/json
---
// requirement is to compare incoming payload login date to id days date and print lessthen six monts login data need to print//
payload map
{
    logindate : $.lastLogin as DateTime {unit: "milliseconds"} as Date {formate: "yyy-mm-dd"} 
} filter ((item, index) -> (item.logindate != null) and ((item.logindate < now() as String {format : "yyyy-MM-dd"} - |P6M|) //need to filter and gets only those records which has login value = systemdate - 180 days(6 months)//
) )

// now() >> "IST"
//now()  - |P6M| 6 months
//now()  - |P6Y| 6 years