%dw 2.0
output application/json
---
//requirement is to skip null data in particular fields in our case fname,lname, mane//

customer: payload.customer map ({ // since it is array i am used map//
    name: {
        fullname: [$.lastName,$.firstName,$.middleName] filter (!isEmpty($) ) joinBy  " "
        // here is the logic we need to remove null strings from the requred fields so i put all those in array and apply filter then !isblank condition it skips null strings//
    },
    sex: $.gender
})