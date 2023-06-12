%dw 2.0
output application/json
---
// here the requirement is to  we have a string containing a non json object we need to formulate it as a meening full json object containing key value pairs//


{(payload.message replace  "{" with "" replace "}" with "" splitBy  "," map ((item, index) -> item splitBy  "=") map {
    ($[0]):$[1]
})} // here i have used [0] and [1] because in array we are getting two values so we need to transform them as key value pairs thats the reson i used those//