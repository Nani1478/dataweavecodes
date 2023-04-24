%dw 2.0
output application/json
var countryMap= [ //variable which needs to compare with i/p payload and update o/p//
 {
  "Country": "Australia",
 "Scope 3 Emissions Source": "APAC Personal Car Emissions"

 },
 {
  "Country": "Canada",
  "Scope 3 Emissions Source": "AMER Personal Car Emissions"
 },
 {
  "Country": "China",
  "Scope 3 Emissions Source": "APAC Personal Car Emissions"
 },
 {
  "Country": "Germany",
  "Scope 3 Emissions Source": "EMEA Personal Car Emissions"
 },
 {
  "Country": "Japan",
  "Scope 3 Emissions Source": "APAC Personal Car Emissions"
 },
 {
  "Country": "Luxembourg",
  "Scope 3 Emissions Source": "EMEA Personal Car Emissions"
 },
{
  "Country": "Netherlands",
  "Scope 3 Emissions Source": "EMEA Personal Car Emissions"
 },
 {
  "Country": "Spain",
  "Scope 3 Emissions Source": "EMEA Personal Car Emissions"
 },
 {
  "Country": "Switzerland",
  "Scope 3 Emissions Source": "EMEA Personal Car Emissions"
 },
 {
  "Country": "United Kingdom",
  "Scope 3 Emissions Source": "EMEA Personal Car Emissions"
 },
 {
  "Country": "United States",
  "Scope 3 Emissions Source": "AMER Personal Car Emissions"
 }
]
---
 // in this requirement we need to compare i/p field "Employee Country" with variable "Scope 3 Emissions Source" and upadte i/p payload with source. For that in this example I am using "case" function let's see//

payload map ( 
    
    // since it is in array so we have operation like map flatmap etc.. for our requirement i am using map operator //

    $  update { // buy using update i am going to update employee country to required variable filed//

// CASE is a "patern matching" function which is used to, A match expression consists of a list of case statements that optionally end with an else statement. Each case statement consists of a conditional selector expression that must evaluate to true or false//  

        case ."Employee Country" -> ( {(countryMap map ( 
    (upper($.Country)) :$."Scope 3 Emissions Source"
//in i/p employee country is in upper case so in variablle we need to change lower case to upper case for that we used upper function and assigning to associated source to it//
                 ))})[$] default $ 
// if there is filed in i/p it will update or else it will print the default value of associated i/p//
    }
)