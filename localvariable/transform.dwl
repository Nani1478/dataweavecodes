%dw 2.0
output application/json
---
// requirement is to transform the given payload into desired o/p i.e modifing given data with custom fields with existing fields from payload//

       // first approach is to normal way by using index references but it is  not recemended//

/*payload map{
    ref: $.id,
    amount: $.characters.value..value[0] as Number,
    reddem: $.characters.value..value[2]
}*/

             // second method by using a local variable//

payload map ((item, index) -> 
 // we have local and global variables so here i used local variable using key word do//
   do {
	var nav = item.characters groupBy $.name // by this we will get [reward, display name, redeem]as roots//
	---
    { ref : item.id,
    amount: (nav["reward"].value..value reduce ($++$$ )) as Number,
        reddem: (nav["redeem"].value..value) reduce ($++$$ )
        // here .. was used .. will extracts all the values/keys with similar names//
   }
 }
)
// beyond the do loob this variable is not going to work that is the functionality of local variable//