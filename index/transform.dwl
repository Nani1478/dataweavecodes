%dw 2.0
var n = ["0", "1", "5"]
output application/json  
--- 
  // here the requirement is to we have payload and variable, variable contains numbers those have to assige to payload as root. And need to change bookid and price as numbers//


n map ((item, index) -> (item) : payload[index]  update {
    case .bookId -> $ as Number
    case .price -> $ as Number
})