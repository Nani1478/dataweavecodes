%dw 2.0
import * from dw::core::Strings
output application/json
---

// here the requirement is to for oredr we need to add lineNo at the same time lft side of line no need to add two more degits 0//
    // leftpad : The specified text is left-padded to the size using the padText. By default padText is " ".Returns left-padded String or original String if no padding is necessary.//

payload map ((item, index) -> 

Orderinfo: //item.Order ++ leftPad(0,2,0) ++ item.lineNo
     item.Order ++ leftPad(item.lineNo,3,0) // (identifier, no.of digits, adding digit)//

                     
)