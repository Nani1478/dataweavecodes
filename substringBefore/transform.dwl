%dw 2.0
import * from dw::core::Strings
output application/json
---
 // here the requirement is to we ned to remove the data after "/" from the i/p data. at the same time need to remove "impl" from the i/p//

(payload map {
    name: ((upper(substringBefore($.Name, "/"))) splitBy  "-")[0]
}) 
// substringBefore: synatax is substringBefore (data, "") data will be printed and remining will be removied//  

// here i have used [0] because i am getting multiple data in array so to oversome this i used this//

   // without using substringBefore function//

/*payload map {
    name: ((($.Name splitBy  "-")[0]) splitBy  "/")[0]
}*/
