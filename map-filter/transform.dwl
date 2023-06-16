%dw 2.0
output application/json
---
// here the requirement is to we have a payload contains array of objects we need to map these fields to desired sields at the same time id and boss id have some keys like those fields are associated in another objects so based on those keys and values we need to assigne a value to bossname field//

payload map 
{
    EmpName: $.name,
    BossName: (payload filter ((item, index) -> item.ID ~= $.bossID )).name reduce($)
}



/*
[
  {
    "EmpName": "123",
    "BossName": "456"
  },
  {
    "EmpName": "345",
    "BossName": "789"
  },
  {
    "EmpName": "456",
    "BossName": "345"
  },
  {
    "EmpName": "789",
    "BossName": "456"
  }
]*/