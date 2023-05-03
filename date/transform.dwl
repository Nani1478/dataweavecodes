%dw 2.0
output application/json
import * from dw::core::Dates
---
//date:  (now() as Date) - |P6M|
//dd: (now() as Date) - |P6M|//
//df: now() as String {format : "yyyy-MM-dd"}
//now()  - |P6Y|
      // simple date and time conversions //
{
   "Current Date and Time": now() >> "IST",
   "LocalDateTime": (now() >> "IST") as LocalDateTime,
   "Date in dd-MM-yyyy format": now() as Date {format: "dd-MM-yyyy"},
   "Date in dd-MMM-yyyy format": now() as Date {format: "dd-MMM-yyyy"},
   "Date in dd/MM/yyyy format": now() as Date {format: "dd/MM/yyyy"},
   "Date in dd/MMM/yyyy format": now() as Date {format: "dd/MMM/yyyy"},
   "Date in dd E, MMM, yyyy format": now() as Date {format: "dd E, MMM, yyyy"},
   "Date in yyyy/MMM/dd format": now() as Date {format: "yyyy/MMM/dd"},
   "Date in dd/MMM/yyyy format": now() as Date {format: "dd/MMM/yyyy"},
   //Instead of HH and hh, kk and KK can be used respectively
   "Date in 24hr Format" : now() as String {format : "dd-MM-yyyy HH:mm:ss"},
   "Date in 12hr Format" : now() as String {format : "dd-MM-yyyy hh:mm:ss a"}  
}