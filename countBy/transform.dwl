%dw 2.0
import * from dw::core::Arrays
output application/json
--- 
// here the requirement is to we have array of objects so from that we have to count number of departments and map the filelds//

payload distinctBy ($.department) map ((item, index) ->{

   department: item.department,
   count: payload countBy ($.department == item.department )
}
 )