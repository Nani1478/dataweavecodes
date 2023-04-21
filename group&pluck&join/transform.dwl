%dw 2.0
output application/json
---
// in the reqirement  we have bunch of data i.e array of objects with different is and some matching fields from that we need following  o/p  [
  /*{
    "id": "594585.1, 533943.1, 594602.1, 765114.1",
    "message": "Error converting data type nvarchar to int.",
    "table": "Data"
  },
  {
    "id": "594586.1, 533944.1, 594603.1, 765115.1",
    "message": "type nvarchar to int1.",
    "table": "Data"
  }
]*/


payload groupBy ((item, index) -> item.message) pluck ((value, key, index) -> {// as a primary step i am grouping based on message by using group by at this point we can see all the data in two sets one containing error message another contains tpe message
    id : value.id joinBy  ", ", // while using value.id we get array of id's  to over come this i used joinBy so that we get instad of arrays a single string containing ids 
    message : key,           // in this we are using key because we don't need to combine message so as it is have to present so i left it.
    table : value[0].table // if we use value. table it gives array of multiple data so we used [0] so thet it will asagin the first vale in table array/ 
})

//in map we can't work on key it allows value and index so we used pluck to get requirement we need to work on key -vale so i used pluck//