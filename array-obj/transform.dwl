%dw 2.0
output application/json
---
// requirement is to inside array we have objects we need to combine these objects into single object it meens array of single object//
payload mapObject ((value, key, index) -> 
    (key): [value reduce ((item, accumulator = {}) ->accumulator ++ item)]
)
