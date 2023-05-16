%dw 2.0
output application/json
---

 // requirement is to we need to remove BCE field based on TYPE= Legal. //

                      // first method by using if/else condition//

/*Document: payload.Document map (if ($.Customer.Type == "Legal")
    $ mapObject ((value, key, index) -> 
      (key): 
        if (key as String == "Customer")
          value - "BCE"
        else
          value
    )
  else
    $)*/

            // second method by using update function//

   payload  update {
       case naveen at.Document -> naveen map ((item, index) -> item  update {
           case nani at .Customer if (nani.Type == "Legal") -> nani - "BCE"
       }   
     )
   }