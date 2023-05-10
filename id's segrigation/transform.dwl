%dw 2.0
output application/json
---
 // the requirement is to all the id's need to be segrigated based on message and assigned to id field//
payload groupBy ((item, index) -> item.message) pluck ((value, key, index) -> 
     // commen thing i observed is message is commen and  id's are different so based on message i am grouping the incoming payload// 
     // then i am mapping fields using pluck// 
{

    id: value.id joinBy ",",
    message: key,
    table: value.table distinctBy ($ ) joinBy  ""
}

)