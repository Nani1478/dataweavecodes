%dw 2.0
import * from dw::core::Strings
output application/json
---
//need to remove numeric values inside a string that containg combination of numbers aswell as non numeric//

"Transaction id": (payload."Transaction id" splitBy  ",") filter (isNumeric($)) joinBy  ","

// first have to segrigate that numric and non numeric data, so that we can easily identifies. For that used splitBy//

//next i used filter for remove non numeric values, for that i imported Strings so that i  can use isNumeric it meens it allows only numeric values o/p is true or false//

// finally once data is segrigated used joinBy so entire data is formulated as a siring//