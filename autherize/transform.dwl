%dw 2.0
output application/json
---
              //authorization code//
 // Here the requirement is to we  need to check Password field if it is 'pass' then we need to add a new field 'security': 'autherised', if it is 'fail' then we need to add a new field 'security': 'unautherised', if it is otherthenthose two then we need to add a new field security: 'null'//  

payload mapObject ((value, key, index) -> (key): value mapObject ((v, k, i) ->

 if(v.password == 'pass' )
 {
     (k): v ++ {
         "security": "autherised"
     }

 } else if(v.password == 'fail')
 {
      (k):v ++  "security": "unautherised"
 }else (k): v


 ) )
 
 
 // payload mapObject ((value, key, index) ->(key): (value mapObject ((value, key, index) ->(key): value ++ {
//     ('security': 'authorized') if( value.password ~= 'pass'),
//      ('security': 'unauthorized') if (value.password ~= 'fail'),
//      ('msg': null) if(value.password != 'pass' and value.password != 'fail')
// }) ))
 
 
