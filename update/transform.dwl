%dw 2.0
output application/json
---
//update based on condition. if licensePlateStatus is new in that condition null value has to assigne if the status is expired no need to be done//

payload map ((item, index) -> item update {
    case .Attributes.radiationDate -> if (item.Attributes.licensePlateStatus == "new")
      null
    else
      $
  }
)