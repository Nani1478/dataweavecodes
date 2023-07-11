%dw 2.0
output application/json
var two =  [
{
employee : 1,
school : "C"
},
{
employee : 3,
school :"A"
}

]
---
//here the requirement is to  comparing two payloads and and have to formulate a new output at the same time need to remove dublicate values//
                              //method1//
two ++ (payload filter ((item, index) -> !(two.employee contains item.employee) or !(two.school contains item.school)))   
                        //second method//
//  (two ++ payload) distinctBy ((item, index) ->item.employee )