%dw 2.0
import * from dw::core::Strings
output application/json
var filter = "search_category:incorporated_company,status_category:active"
---
// the requirement is to we hav a payload stored in variable as form of string need to formulate into a new json object//

{(filter substringBy ((character, index) -> character == "," ) map ('"' ++ ($ substringBefore  ":") ++ '"') : ('"' ++ ($ substringAfter  ":") ++ '"'))}