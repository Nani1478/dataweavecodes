%dw 2.0
output application/json
---
//in the requirement recordIds have to be in single string and have to be listed even we have multiple id's it must list all in a single string separeted by ","//
    //for that since it is in object form we used mapObject//
payload mapObject (value, key, index) ->
if(key~='data') //first iteration it enters into data//
{
    (key): value mapObject (v,k,i) ->
    if(k~='payload') //second iteration enters into payload//
    {
        (k):v mapObject (v1,k1,i1)->
        if(k1~='ChangeEventHeader') //third iteration enters into changeeventheader// 
        {
            (k1):v1 mapObject (v2,k2,i2)-> //fourth iteration it enters into recordid's//
            if(k2~='recordIds') //here we have to perform required operations//
            {
                (k2): v2 flatMap $ reduce ((item, accumulator) -> item ++ ',' ++ accumulator) // requiremet is to we need to combine array of arrays into single string for the we used flat map then we neeto convert array into string for that i used reduce function or else we can use join by also as  (k2): (v2 flatMap $) joinBy  "," this also work like reduce function// 
            }else
            (k2):v2 //if condection satisfies it displays k2-v2//
        }else
        (k1):v1//if condection satisfies it displays k1-v1//
    }
    else
    (k):v //if condection satisfies it displays k-v//
}
else
(key):value //if condection satisfies it displays key-value//