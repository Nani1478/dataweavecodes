%dw 2.0
output application/json
---
// have to group based on region and formulate into a single group//
payload groupBy ((item, index) ->item.region) pluck $ map ((item, index) -> 

//groupBy it will group th items based on selection//
//fro converting object into array we used pluck//
//once transformed into array we apply map to get required fields//
{
    regionname : item.region[0],
    countryList: item.country map { // in country we have array of values so again we map the fileds//
        name: $
    }
}
)