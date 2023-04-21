
%dw 2.0
output application/json
---
// in requirement they provided a array of values they expecting array of objects with a commen key//

flatten((payload.HeaderContNum map ((item, index) ->item ))) map (HeaderContNum: $)

// payload.HeaderContNum will give us array of array so we need to convert into single array for that i used flatten it basically does that array of arrays into single array. after that we can map the entire thing to custome field// //we can use flat map also for this we have may ways to get o/p//