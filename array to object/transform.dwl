%dw 2.0
output application/json
---
// here the requirement is to we need to merge the payload into a single object containg all the values at the same time dublicate keys need to be eliminated//

                    // first method//
    payload reduce ($$++$)  groupBy ((item, index) -> index) mapObject ((value, key, index) -> (key): value[0]) 

               // second method//
 //{(payload)} distinctBy ((value, key) -> key )//