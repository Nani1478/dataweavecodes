%dw 2.0
output application/json
---
// here the requirement is to we hava  a pay load that payload need to be transformed to desired o/p i.e have to map//

payload.Details flatMap ((item, index) -> item.Codes map {
  name: item.Name,
  code: $,
  description: item.Descriptions[$$]
} )


/*[
  {
    "Name": "State",
    "Codes": "ST1",
    "Descriptions": "State 1"
  },
  {
    "Name": "State",
    "Codes": "ST2",
    "Descriptions": "State 2"
  },
  {
    "Name": "Country",
    "Codes": "CNT1",
    "Descriptions": "Country 1"
  },
  {
    "Name": "Country",
    "Codes": "CNT2",
    "Descriptions": "Country 2"
  }
]*/