%dw 2.0
output application/json
---
 // requirement is to we need to remove roots from coming payload in our case we need to remove [A,B,X] and have to formulate array of objects//
   //valuesf will provide array of values without roots/mainkeys which are associated with//

valuesOf(payload) reduce ($++$$)  // from that i just eliminated array of array using reduce operation//
// we can use flaten also to convert array of array to single array.//
 // flatten (valuesOf(payload)) also gives the same responce//