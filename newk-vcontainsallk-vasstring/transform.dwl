%dw 2.0
output application/json
---
  // here the requirement is to add new key value pair in tha object which contains test as key and all the vales in the object need to formulate as a string //

          //first method//

//  payload map ($ ++ {

// test:  "name :" ++   $.Name ++ ", age" ++ $.Age ++ ", country : " ++ $.Country 

//  })

 
                   // second method//
payload map ( $ ++ {

    test: ($ mapObject ((value, key, index) -> k: key ++ ":" ++ value )).*k joinBy  ","
                                              // here i have taken k as root then after operation  completed just removed that root by using .k here i have multiple keys with same name so i used *k to formulate all//
}
)
