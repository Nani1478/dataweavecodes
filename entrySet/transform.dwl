%dw 2.0
import * from dw::core::Objects 
output application/java
---
  // requirement is to print key value pairs uisng index  as [{0={key=name,value=Branch},1={key=value,value=CSE}},{0={key=name,value=Case},1={key=value,value=152314}},{0={key=name,value=Reference_No},1={key=value,value=01234576}}]//

  // since i/p is a object and have to work on index so i am using pluck, since index is not dynamic in this case so i used commen method. assigned to 0 followed by 1 and so on//

 payload pluck ((value, key, index) -> { // if we use mapObject it won't give desired o/p so we can go with pluck//
 "0":{
     key: "name",
     value: key
        },
        "1":{
    key: "value",
    value: value
         }}

 )
     // second way is to we can import entryset from objects import * from dw::core::Objects so we can get entryset//

     //entryset: Returns an array of key-value pairs that describe the key, value, and any attributes in the input object.//


/*(entrySet(payload) map ($) - "attributes") map ((item, index) ->

   // entrySet gives a array as o/p  which contains k-v-attributes so we dont need attributs so we subtract from o/p then using mapping we can get desired o/p//
{
    "0":{
        "key" : "name",
         "value" : item.key
         },
         
    "1": {
        "key" : "value",
        "value" : item.value
        }
    }   