%dw 2.0
output application/json
---
   // here the requirement is to we need to transform the data as test has two values 1,2 and 3,4 they need to form as a key value pairs id as key and value as 1 or 2 or 3 or 4 containing test as root//

payload map {
    name: $.name,
    test: $.test splitBy  "," map ((item, index) ->
    {
        id: item
    } )
}