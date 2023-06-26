%dw 2.0
output application/json
---
// newed to transform data based on client id field and have to add some custom fields too associated with clientid//

keysOf(payload groupBy $.ClientId)map ((item, index) -> 
{
    "ClientId": item,
    "path": "/DataPath",
    "operations": ["PATCH","DELETE"],
    "supplementary":[{
         "key": "resource",
         "values": (payload groupBy $.ClientId)[item].resource
    },{
         "key": "destinationType",
         "values":  (payload groupBy $.ClientId)[item].destinationType
    }
    ]
}
 
)