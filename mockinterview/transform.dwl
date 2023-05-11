%dw 2.0
output application/json
var n = sizeOf(payload.number)/4 //here first i saved a variable that gives 4 as a result based on payload//
---
               // mock interview question// 
               
      // requirement is to split given number into 4 digits as 
 /*  [
       "1234",
       "12345678",
       "123456789123",
       "1234567891234567",
       "12345678912345678912"
     ]
*/ 

0 to n-1 map payload.number [0 to 4 * ($+1) -1]
 //here i have maped 0 to 4 so that we get 5 rows containing number so we need to modifi the number as required//
 //since it is in array i  used [0 to 4 ] and $ iterates untill completion of n-1 scenerio//