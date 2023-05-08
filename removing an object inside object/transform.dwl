%dw 2.0
output application/json
--- 
 // requirement is to we need to remove test from the given payload at the same time in test root if there is any fields they need to be add to existing object i.e root test has to remove and inside test data has to stay// 

payload map ((item,index) ->{
Id: item.Id,
coverage: (item.coverage ++ item.coverage.test) - "test"
            // here i used to add test items to coverage then after i just removed entire test aobject once data retrived by using "-"//
})