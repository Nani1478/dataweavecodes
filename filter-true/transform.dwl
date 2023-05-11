%dw 2.0
output application/json //skipNullOn = "everywhere"
---
   // here the requirement is to  filter the data based on particular field i.e hasContractClaimOrQuote if this fiel is true that data needs to be present remining has to remove//  


           payload filter($.hasContractClaimOrQuote == true)

   // here i have used filter unction just filter the incoming payload by using key word hasContractClaimOrQuote if it is true then the entire data will print or elase removed//


//payload map ((item, index) -> if (item.hasContractClaimOrQuote==false) null else item )
    //another way is to  using conditions here we get null values so to over come this i used skipNullon so it removies all null values in the entire payload//