%dw 2.0
output application/json
---
//here the requirement is to i have a incoming payload probelly looks like json but not json it is in string formate we need to transform that into a proper JSON structure at the same time need to map those fields with required fields//

// here the logic is for this type of requirements first we need to read the payload into a proper formate so that we can achive and transform according to requirement//
payload pluck ((value, key, index) ->{id:key} ++ read(value,'application/json'))  map
{
    id: $.id,
    userPrincipalName: $.Name,
    hireDate: $.DOB,
    persanalEmail: $.persanalEmail,
    businessCountry: $.Country
}