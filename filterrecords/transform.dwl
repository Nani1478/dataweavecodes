%dw 2.0
output application/json
---
// we have a payload there are similar objects with same accounty id we need to eliminate dublicate account id's at the same time it has to check the status must be "New" associated account id has to be present and remining has to remove. Remining unique account id objects has to print asusual//

flatten(((payload groupBy $.AccountId) mapObject ((value, key, index) ->
{
    k: if (sizeOf(value) == 1)
    value
    else value filter $.Status == "New"
} )).*k)