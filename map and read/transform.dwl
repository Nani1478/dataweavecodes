%dw 2.0
output application/json
var abc = {"413" : "{\n \"token\": \"044axOhK6A6YnP+IcS0UBOc9L85aNk/Oidz37LeDQ1uc5A=MDE5MDEyODQzNjM2NjE0Mjg2ODMxMjE3MDE3Mi4xNi4zMi44NjE2Nzg5MDU1MjgyMzk=\",\n \"usage\": \"Free\"\n}"
}
---
//******in above variable we have object that is in the form of string to convert into object we used read function*****//


                 /*read(abc."413", "application/json")*/ 
 
 // read is a function which is used to Reads a string or binary and returns parsed content.This function can be useful if the reader cannot determine the content type by default//  


                            //by using mapobject and read function //


 payload mapObject ((value, key, index) -> 
    (key) : if (value is String) read(value,"application/json") else value //if we see some objects are in form of string, so first we need to check wether it is string or not  then have to convert for that we used if else condition //
 )
