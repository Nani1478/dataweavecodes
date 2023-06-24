%dw 2.0
output application/json
---

// the requirement is to we have a payload contining totalcount and an array of objects we need to loop or iterate based on the totalcount " fixed number of loops"//
(payload.employees  map (()->{
FirstName: $.name,
age: $.age
})) [ 0 to payload.totalcount -3 ]