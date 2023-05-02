%dw 2.0
output application/json
---
// requirement is to remove empty sets/ objects from payload//
     //by using if else condition we can remove empty objects as follows and using filter we are eliminating empty sets//

/*payload mapObject ((value, key, index) -> 

if(key == "BundleOption" )
{
    (key): value filter !($=={})
}else (key):value

)*/
 
 // another way is to using update function //


/*payload  update { 
    case payload at .BundleOption-> payload - {}
} // here after case i use a name (payload) we can use any name in that place and from that i am deleting empty objects// */