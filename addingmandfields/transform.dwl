%dw 2.0
output application/json
var out = ["INSTANCE","OBJNR","AMOUNT","UNIT"]
---
//requirement is to we need to transform the input data to output need to add "INSTANCE","OBJNR","AMOUNT","UNIT" these instances to o/p then need to extract "INSTANCE" values the for first index we ned to add "INSTANCE EQ" and for remining insatance need to add "OR INSTANCE EQ", then need to add "AND OBJNR LIKE 'MA%'" and "'AND VALTO >= 2023-08-28 00:00:00'" then mandatery fields "table": "IBIN" and "rowCount": 2000   has to add

data : [
    {
        fields: out,
        filters: (payload.INSTANCE map ((item, index) ->       
         if(index == 0) "( INSTANCE EQ " ++ "'" ++ item ++ "'"
         else if(index == sizeOf(payload)-1) "OR INSTANCE EQ " ++ "'" ++ item ++ "')"
         else "OR INSTANCE EQ " ++ "'" ++ item ++ "'"
         )) + "AND OBJNR LIKE 'MA%'"
           + "AND VALTO >= '$(now() as String {format:"uuuu-MM-dd"} ++" "++ "00:00:00")'",   
             "table": "IBIN",
              "rowCount": 2000       
    } 
]


/*
  o/p:
   {
  "data": [
    {
      "fields": [
        "INSTANCE",
        "OBJNR",
        "AMOUNT",
        "UNIT"
      ],
      "filters": [
        "( INSTANCE EQ '000000000007616782'",
        "OR INSTANCE EQ '000000000007616784'",
        "OR INSTANCE EQ '000000000007616786'",
        "OR INSTANCE EQ '000000000007616788'",
        "OR INSTANCE EQ '000000000007616790'",
        "OR INSTANCE EQ '000000000007616792'",
        "OR INSTANCE EQ '000000000007616794'",
        "OR INSTANCE EQ '000000000008333118')",
        "AND OBJNR LIKE 'MA%'",
        "AND VALTO >= '2023-08-28 00:00:00'"
      ],
      "table": "IBIN",
      "rowCount": 2000
    }
  ]
}
    */