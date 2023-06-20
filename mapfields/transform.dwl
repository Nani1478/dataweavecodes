%dw 2.0
output application/json
---
// The requirement is to we have two arrays employees and departments through ID is a identifier with that we need to fromulate a new transformed output with required fields//

payload.employees map {
    id: $.id,
    name: $.name,
    department: payload.departments filter ((item, index) -> item.ids contains $.id ) map ((item1, index) -> item1.dept ) reduce ($)
}