%dw 2.0
import * from dw::core::Strings
output application/json
---
// heree the requirement is to we have a string contains alphanumericc and special characters from them we need to populate only numbers//

//flatten(payload.OrderNumber scan(/[0-9]/)) joinBy  ""
//payload.OrderNumber filter (isNumeric($))
payload.OrderNumber substringAfter  "_"