%dw 2.0
import * from dw::core::Arrays
import * from dw::core::Objects
output application/json 
var x = [
  {
    "transaction_id": "16690258549305291",
    "INVOICE_NUM": "65432121"
  },
  {
    "transaction_id": "1669025854",
    "INVOICE_NUM": "98765"
  }
]
---
// based on unique id from second payload has to match to first payload and has to add the field and gives output related to particular unique id//

                           //method-1//
// (payload map ((item, index) -> (x filter $.INVOICE_NUM == item.INVOICE_NUM) map (item ++ {"transaction_id" : $."transaction_id"}))) reduce ($ ++ $$ )


                         //method-2//

leftJoin(x, payload, (i)->i.INVOICE_NUM, (p)-> p.INVOICE_NUM) map (
    $.l mergeWith $.r
)