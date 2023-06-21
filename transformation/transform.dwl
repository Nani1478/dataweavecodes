%dw 2.0
output application/json
var n = [
  {
    "userid": "27517",
    "email": "jjosebadillo@hotmail.com"
  },
  {
    "userid": "27514",
    "email": "cmartin@cfiemail.com"
  },
  {
    "userid": "27515",
    "email": "philip.dupuis@td.com"
  }
]
---
// need to add email field to object based on user id and tyransform the message with required keys//
payload map {
    CourseCode: $.course_id,
    CourseName: $.course_name,
    UserStatus: $.enrollment_status,
    enrollement_date: $.enrollment_created_at,
    expirationDate: $.enrollment_validity_end_date,
    CompletionDate: $.enrollment_completion_date,
    userid: $.user_id,
    email: n filter ((item, index) -> $.user_id ~=item.userid ) map ((item, index) -> item.email) reduce ($ )
}