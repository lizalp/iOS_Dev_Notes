//: [Previous](@previous)

import Foundation

let volunteerCount = [1, 3, 4, 6, 9, 15, 62, 34]

//(Int, Int) -> Bool
func isAscending(_ lhs: Int,_ rhs: Int) -> Bool {
    return lhs < rhs
}


let sortedVolunteerCount = volunteerCount.sorted(by: isAscending)

print(sortedVolunteerCount)

let sortedVolunteerCountClosure = volunteerCount.sorted(by: { (lhs: Int, rhs: Int) -> Bool in
    return lhs < rhs
})

print(sortedVolunteerCountClosure)

let sortedVolunteerCountClosureBis = volunteerCount.sorted(by: { (lhs, rhs) in lhs < rhs
    //return lhs < rhs como solo es una linea se puede omitar el return
})
print(sortedVolunteerCountClosureBis)

let sortedVolunteerCountClosureTris = volunteerCount.sorted(by: { $0 < $1
    //(lhs, rhs) in lhs < rhs se puede omitir por $0 < $1
    //return lhs < rhs como solo es una linea se puede omitar el return
})
print(sortedVolunteerCountClosureTris)

let sortedVolunteerCountClosureFortis = volunteerCount.sorted(by: <)
print(sortedVolunteerCountClosureFortis)

//: [Next](@next)
