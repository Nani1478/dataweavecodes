%dw 2.0
input payload application/csv header=false,separator="|" 
     // since input is csv and separator as | we need to add above header without this we get an empty array. to overcome this we need to add above//
output application/json
---

  // here the requirement is to we have a input in csv formate and "|" as separator need to map these fields with desired keys what they provided and formulate a json output//

payload map {
  "employee": {
    "employeeId": $."column_1",   // here we are seeing column_ once we add in header above thing we can see a payload that contains column 0 to cloumn9 as keys and respective values//
    "employeeName": "",
    "employeeLocation": $."column_3",
    "employeeAddress": {
      "employeeAddress": $."column_4" // keys are provided by them and just maped the values to desired keys//
    },
    "employeeSalary": $."column_5",
    "employeeDepartment": {
      "employeeDepartment": $."column_6",
      "employeeGrade": $."column_7",
      "DepartmentAddress": {
        "Address": $."column_8"
      }
    },
    "employeeType": $."column_9"
  }
}