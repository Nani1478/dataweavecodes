%dw 2.0
output application/json
---
 // the requirement is to  we need to eliminate som fields i.e keys which are starts with pc and tc//

//payload filterObject ((value, key, index) -> value !="false" )

payload -- (payload filterObject ((value, key, index) -> (key as String startsWith  "pc") or (key as String startsWith  "tc")))
 // so first i filter the payload based on keys pc and tc then i just removied from the object//