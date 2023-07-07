%dw 2.0
output application/json
---
// here the requirement is to key and values  are in two different arrays keys are in metricHeaders as name associated values, and values are in metricValues value associated values. task is to  formulate a new object that contains these keys and values to fomulate a new object//

{(payload.rows.metricValues map ((item, index) -> 
{
   (payload.metricHeaders map ((i, in) ->  (i.name): item.value[in]))
}
 ))}