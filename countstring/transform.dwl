%dw 2.0
output application/json
---
// we have a input payload containing a string task is to wee need to count num,ber of same elements at the same time we need to add the count to string and reformulate to new string//

"input": payload.Input groupBy $ mapObject ((value, key, index) -> (key): sizeOf(value) ) pluck ((value, key, index) -> (key) ++ value) joinBy  ""