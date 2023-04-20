%dw 2.0
output application/json
var empty=(payload filter ($.parentId == "" )) map $.id
var new= payload filter ( empty contains $.parentId)
---
          //first way of code using variables for minimising complex code//

/*empty map ((item, index) -> 
{
    parent: item,
    chaild: payload filter ($.id==item ) ++ (new filter ((childItem, index) -> childItem.parentId == item ))
})*/
       //second way of doing it by groupBy function//

namesOf(payload groupBy (if($.parentId == "") $.id else  $.parentId)) map ({
    parentid: $,
    chaild:(payload groupBy (if($.parentId == "") $.id else  $.parentId)) [$]
})
//namesOf : is a function which is used to Returns an array of strings with the names of all the keys within the given object
 
 //groupBY: Returns an object that groups items from an array based on specified criteria, such as an expression or matching selector.
 
//filter: Iterates over an array and applies an expression that returns matching values.
 
 //in above requirement we need to replace empty strings with "id" for that we used a condition "if/else", output is in arry so we used map function as well as for grouping purpose we used groupBy function. there might be many ways to do this i have found two of them