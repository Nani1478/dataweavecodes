%dw 2.0
output application/json
---
// here the requirement is to formate the vales up to two decimels//

payload map 
  {
      rate: ($.rate * 100) as String {format: "#.####"},
      appy: ($.APY * 100) as String {format: "#.####"}
  }