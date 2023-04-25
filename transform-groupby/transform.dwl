%dw 2.0
output application/json
---
 //**** */ requeriment is to users working in different ors with different roles so we need to group by organization id and map the user to role with respect to associated arganizationId******//

flatten(payload map ((item, index) -> // since i/p is array we can use map flatmap etc.. in this i am usig map to map respective fields//
            item.Organization map (
               { "Organization": $.Organization,
                  "Role_Name": $.Role_Name,
                   "User_Name" : item.User_Name
                })
             )) groupBy ((item1, index) -> // by using group by i am going to group  users based on organization//
                             item1.Organization
                              ) mapObject ((value, key, index) -> { //  since we have used flatten at the biggening we get an object so by using map object i am mapping user name based on oraganization//
                                     "Organization" : value.Organization[0] ,
                                     // here  i used [0] because in organization 100-us two users worked so it formulate a array and shows us 100-us two times to over come this i used [0]//
                                      "User_Name": value map(
                                //normally mapped using map user and role to get desired o/p//
                                                 {
                                                    "User_Name": $.User_Name,
                                                    "Role_Name": $.Role_Name
                                                 }
                                               )
                                             }
                                          )