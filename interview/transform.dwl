%dw 2.0
output application/xml
---
 // here the requirement is to in xml we need to remove ssn and password from th inpuit payload//

                   // method 1 ( hard code)//

// users:payload.users mapObject 'user':
// {
//     personal_information: $.personal_information - 'ssn',
//     login_information: $.login_information - 'password'
// }

                        // method 2 ( if else) //

//     payload mapObject ((value, key, index) -> (key): value mapObject ((v, k, i) -> (k): v mapObject ((v1, k1, i1) ->
 
//  if(k1 ~= 'personal_information')
//  {
//       (k1): v1 filterObject ((v2, k2, index) -> !(k2 contains 'ssn') )
//  } else if(k1 ~= 'login_information')
//  {
//      (k1): v1 filterObject ((v3, k3, i) -> ! (k3 contains 'password') )
//  }else (k1): v1
//   )
//  ) )
                              // method 3 ( update) //

    payload mapObject ((value, key, index) ->  (key): value mapObject ((v, k, i) ->
    
               (k): v  update {
                   case .personal_information -> $ - 'ssn'
                   case .login_information -> $ - 'password'
               }
    
    
     ))