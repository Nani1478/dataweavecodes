%dw 2.0
output application/json
---

// here the requirement is to  we have array of objects we need to formulate all those in a single array containg key value are seperated by ","//

                  // method-1//
// payload map ((item, index) -> "EXTERNAL_ID="  ++ item.EXTERNAL_ID ++ "," ++   "MATERIAL_EXTERNAL_ID=" ++ item.MATERIAL_EXTERNAL_ID
// )
                //method-2//
payload map ((item, index) -> item pluck $$ map ((i, in) -> 
          i ++  " =" ++ item[i]
) joinBy  ", "
 )