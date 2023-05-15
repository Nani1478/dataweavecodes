%dw 2.0
output text/plain
---
 // requirement is to i/p is csv for that csv we need to add another row containing total records, size, UADM USER PROFILE DATA STANDARD 2.2. and the o/p is text fromate//

write(payload, "application/csv") ++ ("total records , "  ++ sizeOf(payload) ++ "," ++ "”UADM USER PROFILE DATA STANDARD 2.2”")
 // for that i have used write functiuon added the required fields to i/p//