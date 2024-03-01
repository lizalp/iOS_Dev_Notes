import UIKit

let volunteerCounts = [1,2,3,43,25,6,13]

func isAscending(_ i: Int, _ j: Int) -> Bool {
    return i < j
}

let volunteersSorted = volunteerCounts.sorted(by: { lhs,rhs in
    return lhs > rhs
})

//trailing clousure
let volunteersSortedTwo = volunteerCounts.sorted { lhs,rhs in
    return lhs > rhs
}

func doFunction(on: String, inputParam: (() -> ()), then completion: (() -> ()) ) {
    
}

//multiple trailing clousure
doFunction(on: "on parameter") {
    
} then: {
     
}

//mapear valores
// por ejemplo cuando codificas o decodificas
func format(numbers:[Double], using formatter: (Double) -> String = {"\($0)"}) -> [String] {
    var result = [String] ()
    for number in numbers {
        let transformer = formatter(number)
        result.append(transformer)
    }
    return result
}
let rounder: (Double) -> String = { (number: Double) -> String in
    let roundedNumber = number.rounded()
    let intRoundedNumber = Int(roundedNumber)
    return "\(intRoundedNumber)"
}
let volunterAvarages = [10.5, 4.3, 7.6, 8.4, 9.3, 2.1]

let roundedVolunteerAvarages = format(numbers: volunterAvarages, using: rounder)

print(roundedVolunteerAvarages)

// ---- qué pasa cuando un closure esta dentor de un scop
// Enclosing Scop
func experimentWithScopes() {
    var numbersOfTransformations: Int = 0
    let rounder: (Double) -> (String) = {
        return "\(Int($0))"
    }
    let volunterAvarages = [10.5, 4.3, 7.6, 8.4, 9.3, 2.1]

    let roundedVolunteerAvarages = format(numbers: volunterAvarages, using: rounder)

    print(roundedVolunteerAvarages)
}
