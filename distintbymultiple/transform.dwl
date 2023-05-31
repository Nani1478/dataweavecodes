%dw 2.0
output application/json skipNullOn = 'everywhere'
---
 // the requirement is to we need to delete objects based on operation field . repeted objects neeeds to be removied//
 
//payload distinctBy ((item, index) -> item.oderId ++ item.componentId)
//payload filter ((item, index) -> item.operation ~= "add" )
payload map
{
    (dt: $) if $.operation != 'remove'
}.dt