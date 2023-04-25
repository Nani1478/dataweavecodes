%dw 2.0
output application/json
//import * from dw::util::Values
var a = {
 "food":[
    {
      "name":"applePie",
      "type":"dessert",
      "price":100
    },
    {
      "name":"pizza",
      "type":"italian",
      "price":370
    },
    {
      "name":"burger",
      "type":"macCheese",
      "price":310
    },
    {
      "name":"salad",
      "type":"Veg",
      "price":50
    },
 {
      "name":"Wraps",
      "type":"cheese",
      "price":150
    },
    {
      "name":"Cake",
      "type":"dessert",
      "price":45
    },
    {
      "name":"Chocolate",
      "type":"dessert",
      "price":310
    },
    {
      "name":"rice",
      "type":"Veg",
      "price":50
    }
 
  ],
  "drinks":[
    {
      "name":"coke",
      "type":"coldDrink",
      "price":75
    },
    {
      "name":"coffee",
      "type":"hotDrink",
      "price":40
    },
    {
      "name":"tea",
      "type":"hotDrink",
      "price":35
    },
    {
      "name":"freshJuice",
      "type":"coldDrink",
      "price":50
    }
  ]
  
}
 
var b = {
 "food": [
  {
   "name": "applePie",
   "type": "dessert",
   "price": 100
  },
  {
   "name": "pizza",
   "type": "italian",
   "price": 370
  },
  {
   "name": "pizza",
   "type": "italian",
   "price": 370
  }
 ],
 "drinks": [
  {
   "name": "coke",
   "type": "coldDrink",
   "price": 75
  },
  {
   "name": "coffee",
   "type": "hotDrink",
   "price": 40
  }
 ]
} 
// as shown above we have two payloads  our task is to compere both payloads//
    /*1. if payload 1 is matching with payload 2 we need to print payload 1 
      2. if payload is notmatching with payload2 then we need to merge these two payloads and print           combine payload 
      3. if both payloads are matcging in some fileds in that case we need to merge all those and             print combined payload */
var food = (a.food ++ b.food) // first i am adding both payloads containg food as root storing in avariable//
var distintFood= food distinctBy ((item, index) -> item) // in food root eleminating/ print unique k-v's storing in avariable//
var drinks = (a.drinks ++ b.drinks) // no adding both payloads containg drinks as root and storing in a variable//
var distintdrinks=drinks distinctBy ((item, index) -> item) //// in drinks root eleminating/ print unique k-v's and storing in a variable//
---
  // our gole is to combine both payloads and print roots and key value pairs ad satisfy given three                                 conditions//

{    ("food": distintFood map ((item, index) -> //maping food root which containing in both payloads//
{
   "name": item.name,
   "type": if (sizeOf(b.food filter ($.name == item.name)) > 0 ) (b.food filter ($.name == item.name))[0]."type" else item."type", //we have already  added and identified unique k-v's in both payloads and stored in variable so by using that, we have some changes in payload 2 for satisfing that condition if /else condition is used  i am matching  size of payload graterthen 0 to payload 2 items so i can get the values and doing the same for reminng fields//

   "price": if (sizeOf(b.food filter ($.name == item.name)) > 0 ) (b.food filter ($.name == item.name))[0]."price" else item."price"
})distinctBy ((item, index) -> item)), // before going to drinks section here we have multiple dublicate values so to restrict that we use distinctBy to print unique and eliminate repeted key value pairs//
(drinks : distintdrinks map ((item, index) ->  // doing the same thing to drinks too as i did in food section need to compare and add the items//
{
   "name": item.name,
   "type": if (sizeOf(b.drinks filter ($.name == item.name)) > 0 ) (b.drinks filter ($.name == item.name))[0]."type" else item."type",
  "price":if (sizeOf(b.drinks filter ($.name == item.name)) > 0 ) (b.drinks filter ($.name == item.name))[0].price else item.price
 
}) distinctBy ((item, index) -> item))} // removing dublicate values and print unique objects here i took item so it will remove dublicate entire items//
