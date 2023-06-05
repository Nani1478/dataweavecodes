%dw 2.0
output application/json
var productIds =["1","2"]
---
// here the requirement is we need to filter the payload based onproduct id and order id if product id is 1 or 2 need to remove at the same time order id grater then 1 it has to present// 

payload filter (!(productIds  contains $.PRODUCT_ID) or ($.ORDER_ID > 1)) 
