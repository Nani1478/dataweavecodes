%dw 2.0
output application/json
---
// here the tequirement is to we have a payload contains a string  from that string we need to  map values and formulate requred fields i.e id and cid as fields//


 // flatten (payload.languageCode scan  /'.*?'/)
 //payload.languageCode scan /'.*?'/
//  {
//      id: (payload.languageCode scan /'.*?'/)[0][0] [1 to -2] as Number,
                                            
//      cid: (payload.languageCode scan /'.*?'/)[1][0] [1 to -2]

//  }
{
  id: flatten(payload.languageCode scan /'.*?'/)[0][1 to -2] as Number,
                                              // here i have used [0] and [1 to -2] because we are getting array og strings and at the same time string containing  another string in it i.e "'19093'" to over come this i used these notations//
  cid: flatten(payload.languageCode scan /'.*?'/)[1][1 to -2]
}