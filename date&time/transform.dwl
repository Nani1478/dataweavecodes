%dw 2.0
output application/json
import * from dw::core::Dates 
---
// in requirement month datae and year are in the form of month as name of month instad of value so we need to formate it//
payload.date  as LocalDateTime {format: "MMM dd, yyyy hh:mm:ss a"} as DateTime
                                     // formating using standard method// 

//we can find localdatetime in Dates module in functions we can import them form dates as shown above//
