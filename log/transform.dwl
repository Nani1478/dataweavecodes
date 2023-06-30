%dw 2.0
output application/json
---
// requirement is to in array we have us and uk if us existes in that case all null values must be replace with NA remining has to leftover//

ProductInformation : payload.ProductInformation map log((
    $ mapObject ((value, key, index) -> 
        (key) : if(value contains "US") value map($ default "NA" )  else value
    )
))