%dw 2.0
output application/json
---
  // here the requirement is to we have a payload that contains num as field  need to map those filed and get a single object i.e we get array of objects containg single number //
payload flatMap {
      num: $.*Num map ((item, index) -> {
          num:item,
          result: {
          success: $.result.success,
          reson: $.result.reason
      }
          }),
}.num distinctBy ((item, index) -> item)

/*
payload map {
      num: $.Num,
      result: {
          success: $.result.success,
          reson: $.result.reason
      }
}*/