%dw 2.0
output application/json
---
// here the requirement is to array of objects need to formulate as a single object containing only unique k-v i.e eliminate dublicate k-v pairs //

       // first method//

//{(payload)} distinctBy ((value, key) -> key )


               // second method// 
               
payload reduce ($$++$ ) groupBy ((item, index) -> index ) mapObject ((value, key, i) -> 
                (key) : value[0]
        
        )