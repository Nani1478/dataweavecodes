%dw 2.0
output text/plain
---

   // requirement is to add custom  test to comming payload then the data has to modifi and o/p has to be in text formate//

(payload map ((obj, index) -> ("--batch\n" ++ "Content-Type: application/http\n\n" ++ "GET address\$filter=Id+eq+'" ++ obj.Id ++ "'+and+Name+eq+'" ++ obj.Name ++ "'&\$format=json HTTP/1.1\n\n"))) joinBy  "/n"
// in above code all the strings are custom text based on requirement i wrote all the thing consept is to we need to convert incoming json to text with custom text//