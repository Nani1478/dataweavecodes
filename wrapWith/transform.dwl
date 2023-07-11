%dw 2.0
output application/csv  header=true, quoteValues=true
import * from dw::core::Strings
---
// requirement is to we need to transform data to CSV. here header values must be in quatations like values.//
//wrapWith : Wraps the specified text with the given wrapper. Introduced in DataWeave version 2.2.0.//
                      //method1//
payload map (
    $ mapObject ((value, key, index) -> 
        (wrapWith(key, '"')) : value
    )
)



                    //method2//
/*%dw 2.0
var data = [
{
'Last Name': "Ane",
"Empl Number": "8631"
}
]
output application/csv header=true, quoteValues=true, quoteHeader=true
---
data */
