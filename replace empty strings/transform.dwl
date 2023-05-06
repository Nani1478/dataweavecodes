%dw 2.0
output application/json skipNullOn = 'eneywhare'
---
 // requeriment is to we have array of objects in this objects we have array inside it in that some fields are empty ""  task is to remove these empty strings ""//

       // if we observe empty strings are inside an array of object so to enter into it used map function //
     payload map ( $   update {
          // here i use update function it contains upadte and case as expressions//
         case naveen at .product.insuredItems -> naveen filter($ != "")
              // is a custom name at is the key ward where we need to upadte have to mension here//
                   //our case is to remove empty strings from "insureditems" so i used fliter so it will print o/p by removing ""//
     } 
     )