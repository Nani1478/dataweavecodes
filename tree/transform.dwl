%dw 2.0
output application/json
var input2 = [
    "customerContact": true,
    "reply": false,
    "history": "not available",
    "display": "144 Hz",
    "chatBot": "France",
    "promotion": true
]
var nObject = {(input2)}
import * from dw::util::Tree
---
 // we need to assigne values to assocated payload keys//
                     //method-1//
payload  update {
    case .Chats.customerContact -> (input2.customerContact) joinBy ""
    case  .Chats.reply -> (input2.reply) joinBy ""
    case .Service.history -> (input2.history) joinBy ""
    case .Home.display -> (input2.display) joinBy ""
    case .Recommendation.chatBot -> (input2.chatBot) joinBy ""
    case .Recommendation.promotion -> (input2.promotion) joinBy ""
 }

        //method-2//

// payload mapLeafValues (value, path) -> nObject[path[-1].selector]