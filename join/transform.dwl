%dw 2.0
import * from dw::core::Arrays
output application/json
var n =[
  {
    "SIRET": "85295154000016",
    "NUM_ETUDE": "078151"
  },
  {
    "SIRET": "9877777777",
    "NUM_ETUDE": "078152"
  },
  {
    "SIRET": "40986858500012",
    "NUM_ETUDE": "089074"
  },
  {
    "SIRET": "41410685600019",
    "NUM_ETUDE": "089075"
  }
]
---
 // here the requirement is to use join function we can see that in arrays, we have two payloads based on matching Siret number from variable n num_etde has to add to payload//

 // join Joins two arrays of objects by a given ID criteria. join returns an array all the left items, merged by ID with any right items that exist.//

  // syntax join(payload1, payload2, (p1) -> p1.field, (p2) -> p2.field) 
      // here (p1) referes to payload1 and (p2) referes to payload2 based on those selection it returns combined payloads based on selected field criteria//

 join(payload, n, (n1) -> n1.ENT_SIREN ++ n1.ENT_NIC , (n2) -> n2.SIRET) map {
     ($.l ++ $.r - 'SIRET')
 }
