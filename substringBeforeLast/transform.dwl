%dw 2.0
import * from dw::core::Strings
output application/json
---
// here the requirement is to we need to modify time have to remove Z and add 04:00 it//

"attendance":payload.attendance map ((item, index) -> 
 item mapObject ((value, key, index1) -> 
 (key):substringBeforeLast(value, "Z") ++ "-04:00"
 )
)