%dw 2.0
output application/json skipNullOn="everywhere"
---
  // here the requirement is to we need to check if any field contains null values, if they existes we need to remove entire object which contains null values//
                     // first method //
    // By using if else condition here we are checking the items contains null values we are replacing them with "" and removing "" after process completed//
//(payload map (() -> if ($.. contains null) "" else $ )) - ""
    
                  // second method//
    // here we are simpely eliminating entire null values by using skipNullon everywhere//
payload map ((item, index) -> if((item..) contains(null)) null else item)