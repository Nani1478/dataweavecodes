%dw 2.0
output application/json
---
//requiremet is to eliminate dublicate objects based on emp id at the same time have to check date also if we have multiple logs on same day then latest log has to kept remining log has to remove// 


payload.EMPLOYE_EXPORT_UCN distinctBy ((item, index) ->  item.EMP_ID ++ (item.EMP_DATE_EXPORT as Date)) 

// for that i used distinctBy  we have to fields empid aswell as emp date//
//in some cases we get o/p in zigzag mode in that case we can use orderBy  too//