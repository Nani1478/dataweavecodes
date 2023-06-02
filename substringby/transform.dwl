%dw 2.0
import * from dw::core::Strings
output application/json
---
  // here the requirement is to in payload we have a string so need to transform that string into  key value pairs i.e need to saperate by , and assigne a root to value/


         // method 1//
// payload.oneTis splitBy  "," map {
//     oneTis: $
// }
        // method 2//

payload.oneTis substringBy ($ == ",") map {
    oneTis: $
}

// substringBy it splits the payload based on condition what we have given work like splitBy. it gives o/p in array//