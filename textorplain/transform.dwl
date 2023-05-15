%dw 2.0
output text/plain
---
 // requirement is to formulate all values from i/p as a text o/p.//

                  // first method//
//(payload map($ pluck ((value, key, index) -> value default "" ) joinBy  ",")) joinBy  "\n"


                        // second method//
//payload map (($.id default '') ++ ($.name default '') ++ ($.email default '') ++ ($.company default '')) joinBy  "\n"

                      // third method//
(payload map (valuesOf($) joinBy  ",")) joinBy  "\n"