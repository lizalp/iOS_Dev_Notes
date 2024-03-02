import Foundation
//type constraints

//protocolo Equatable
func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool {
    return first ==  second
}

func checkIfDescriptionMatch<T: CustomStringConvertible, U: CustomStringConvertible>(_ first: T, _ second: U) -> Bool {
    first.description == second.description
}

checkIfDescriptionMatch(1, 1)
checkIfDescriptionMatch(1, "1")

struct Car {
    let name: String
    let year: Int
}

extension Car: Equatable {
    static func == (lhs: Car, rhs:Car) -> Bool {
        return lhs.year == rhs.year
    }
}

let myFirstCar = Car(name: "Leon", year: 2024)
let mySecondCar = Car(name: "Jetta", year: 2016)

checkIfEqual(myFirstCar, mySecondCar)
