%dw 2.0
import * from dw::core::Arrays
output application/json 
 var input2 =  [
  {
   "email": "aa@aa.com",
   "RegistrationDate": "2023-05-09T19:06:39Z"
  },
  {
   "email": "bb@bb.com",
   "RegistrationDate": "2023-05-09T18:28:30Z"
  },
  {
   "email": "dd@dd.com",
   "RegistrationDate": "2023-05-09T14:33:40Z"
  }

]

---
// requirement is to we need to secgrigate by using email id and have to add the second payload RegistrationDate to first payload object and id need to be removed//

                             // first method//
(payload flatMap ((item, index) -> (input2 filter $.email == item.email) map (item ++ {"RegistrationDate" : $."RegistrationDate"}))) map $ - "id"

                          //second method//
//  join(input2,payload, (in)-> in.email, (p)-> p.email) map ( $.l ++ $.r.&globalID)
