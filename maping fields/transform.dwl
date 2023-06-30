%dw 2.0
output application/json
---
// maping data to get required transformation by using map//
student: payload.StudentList.*StudentInfo map (
  {  "studentId": $.StudentID,
      "firstName": $.FirstName,
      "middleName": $.MiddleName,
      "lastName": $.LastName,
      "addresses":[
          {
          "addressType": "Primary",
          "addressLine1": $.StudentPrimaryAddress.AddressLineOne,
          "addressLine2": $.StudentPrimaryAddress.AddressLineTwo,
          "city": $.StudentPrimaryAddress.CityName,
          "state": $.StudentPrimaryAddress.State
          },{
              "addressType": "Mailing",
          "addressLine1": $.StudentMailingAddress.AddressLineOne,
          "addressLine2": $.StudentMailingAddress.AddressLineTwo,
          "city": $.StudentMailingAddress.CityName,
          "state": $.StudentMailingAddress.State
 
          }
      ]
  }
)