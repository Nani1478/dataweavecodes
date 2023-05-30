%dw 2.0 
output application/x-ndjson
---
// here the requirement is to we have array of objects and expected output is to formulate individual objects//

 // for that we have a option called ndjson MIME type  actually it takes array as input and formulates new line seperated key value pairs//


 // ndjson MIME type: DataWeave represents the Newline Delimited JSON format (ndjson) as an array of objects. Each line of the ndjson format is mapped to one object in the array//

               // type-1 fro this we need to chage o/p to text/plain//
//trim(write(payload, 'application/json')) [1 to -2]

         // type-2 fro this we need to change o/p type as application/x-ndjson//

payload map ((item, index) -> {
    id : item.id,
    values : item.values
})