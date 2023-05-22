%dw 2.0
output application/json
---
 // here the requirement is to from the input payload we have outputs as a root and containing array of objects task is to tha values inside the array need to formulate as a new object containing values as key value pairs//


       // method1

//payload.FieldHeader.body.ResponsePayload.impFields.outputs map ((item, index) ->(item.name): item.value )

       // method 2

//((flatten(payload..outputs) map ($.name) : $.value)) 

     // method 3

flatten(payload..outputs) reduce (it, ac={})-> ac ++ {(it.name) : it.value}
                                      // here i have assigne it and ac. assigned a value {} ac because while running code we get ac value  we don't need it to overcome this i was assigned  empty object for that//

    // method 4

//(flatten(payload..outputs) map ($.name): $.value) reduce ($ ++ $$)