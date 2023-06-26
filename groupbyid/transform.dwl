%dw 2.0
output application/json
---
// the requirement is to we have multipel keys with objects so matched keys needto merg with object and formulate as a single objects containing single root//

payload groupBy $$ mapObject ((value, key, index) -> 
  (key): value mapObject ((v, k, i) -> v)
)