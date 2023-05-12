%dw 2.0
import * from dw::util::Values
output application/json
---
  // here the requirement is to based on field status "licensePlateStatus" if it is new then radiationDate field have to modified as "" or else it has to be remine as it is //

payload map ((item, index) -> item update {
    case .Attributes.radiationDate -> if (item.Attributes.licensePlateStatus == "new")
      ""
    else
      $
  }
)
