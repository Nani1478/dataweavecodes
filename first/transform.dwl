%dw 2.0
import * from dw::core::Strings
output application/json
---
 // here the requirement is to wqe need to group by year at the same time need to print individual values associated with that year//
 
 payload.AU groupBy ((item, index) -> item substringAfter"-") mapObject ((value, key, index) -> (key first  4) : value )