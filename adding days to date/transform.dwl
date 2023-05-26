%dw 2.0
import * from dw::core::Dates
output application/json
---
 // Here the requirement is to in payload er are getting a end date so based on this end date if it is empty or null in that case we have to add 60 days to deadline and have to ad 30 days to ship date. if we have a particular date in thet field have to print exact date what they provided as well as need to substract 30 days from shipdate//
       // method 1

if (payload.EndDate == "" or payload.EndDate == null)
  {
    DEADLINE: today() + |P60D|,
    SHIP_DATE: today() + |P30D|
  }                                // here |P60D| and |P30D| are nothing but 60 days and 30 days adding to date formate//
else
  {
    DEADLINE: payload.EndDate,
    SHIP_DATE: payload.EndDate - |P30D|
  }
                   // method 2
// {
//     (DEADLINE: today() + |P60D|)if (payload.EndDate == "" or payload.EndDate == null),
//     (SHIP_DATE: today() + |P30D|)if (payload.EndDate == "" or payload.EndDate == null),
//     (DEADLINE: payload.EndDate) if(payload.EndDate ~= "2023-07-01" ),
//     (SHIP_DATE: payload.EndDate - |P30D|) if(payload.EndDate ~= "2023-07-01" )
// }
