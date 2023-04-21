%dw 2.0
input payload application/csv header = true
output application/json
---
//in requirement they need to convert CSV data to Json at the same time each record has to be present in array formate//
names: payload map  ( valuesOf($) ) 

// valuesOf : Returns an array of the values from key-value pairs in an object. it will tahe vales of keys and print in array. so it i choose valuesOf to get it//
//above i mensioned header = true it will give o/p as dis played if we give false it will give keys also in array formate