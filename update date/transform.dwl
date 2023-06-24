%dw 2.0
output application/json
---
// the requirement is to need to modify the date in input payload i.e formating date filed to uuu-MM-dd HH:mm:ss//
message: payload  update {
    case .event.dateTime -> $ as DateTime as String {format: 'uuu-MM-dd HH:mm:ss'}
    case .event.statusHistory -> $ map (it)-> it  update {
        case .dateTime -> $ as DateTime as String {format: 'uuu-MM-dd HH:mm:ss'}
    }
    case .details.custom -> $ map (it1)-> it1  update {
        case .substitutions -> $ map (it2)-> it2  update {
            case .value -> $ as DateTime as String {format: 'uuu-MM-dd HH:mm:ss'}
        }
    }
}