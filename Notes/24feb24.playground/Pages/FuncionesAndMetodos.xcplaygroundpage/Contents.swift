//: [Previous](@previous)
import Foundation

func myPrintingFuction() {
    print("Hello")
}
myPrintingFuction()

//func printingFunction(name: String) {
//    print("Hello \(name)")
//}
//printingFunction(name: "Liz")

func add(lhs: Int, rhs: Int) {
    print("\(lhs) + \(rhs) = \(lhs + rhs)")
}
add(lhs: 5, rhs: 3)

func printingWelcomeMessage(to name: String) {
    print("Hello \(name)")
}

//func printingWelcome(message: String, to name: String) {
//    print("\(message): \(name)")
//}
//printingWelcome(message: "Hello", to: "liz")

func printWelcome(for course: String = "Diplomado de Base de Datos", to name: String) {
    print("\(course): \(name)")
}
//arity
printWelcome(for: "Diplomado iOS", to: "liz")
printWelcome(to: "liz")

//in-out parameters
var error = "The process failed: "
func appendErrorCode(_ code: Int, toErrorString errorString: inout String) {
    errorString += "\(code) bad request"
}
print(error)
appendErrorCode(400, toErrorString: &error)
print(error)

//returning from a function
func printWelcomeMessages(to name: String) -> String {
//    let message = "Welcome to the course: \(name)"
//    return message
    // return "Welcome to the course: \(name)"
    "Welcome to the course: \(name)"
}

let welcomeMessage = printWelcomeMessages(to: "Lizita")
print(welcomeMessage)

print(printWelcomeMessages(to: "lizita"))

func areaOfTriangle(base: Double, height: Double) -> Double {
    let rectangleArea = base * height
    func divide() -> Double {
        return rectangleArea / 2
    }
    return divide()
}

let triangle = areaOfTriangle(base: 10.5, height: 3.4)
print(triangle)

// multiple return
func sortedEvenOddNumbers(_ numbers: [Int]) -> (even: [Int], odd: [Int]) {
    var even = [Int] ()
    var odd = [Int] ()
    
    for number in numbers {
        //modulo --> reminder
//        if number % 2 == 0 {
//            even.append(number)
//        } else {
//            odd.append(number)
//        }
        if number.isMultiple(of: 2) {
                  even.append(number)
                } else {
                    odd.append(number)
                }
    }
    return (even: even, odd: odd)
}

let aBunchOfNumbers = [10, 1, 5 ,78 ,23, 17, 20, 22]
let sortedNumbers = sortedEvenOddNumbers(aBunchOfNumbers)
print(sortedNumbers.even)
print(sortedNumbers.odd)
print(sortedNumbers)


// ! --> crash operator

func grabMiddleName(fromFullName: (String, String?, String)) -> String? {
    return fromFullName.1
}

let middleName = grabMiddleName(fromFullName: ("Liz", nil, "Alpi")) ?? "No middle name" //imprime el mensaje

if let middleName = grabMiddleName(fromFullName: ("Liz", nil, "Alpi")) {
    //no va a hacer nada
    print(middleName)
}

//print(grabMiddleName(fromFullName: ("Liz", nil, "Alpi"))!) //crashea el programa 😣

// Exiting early from a function
func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) -> String {
    //if middle name -> Hey,  \(middle) name
    //else middle -> hey there
   // posible solucion: return "hey, \(name.middle ?? "there)"
    
    // usando if let -> asigna si no es opcional
//    if let middleName = name.middle {
//        return "Hey, \(middleName)"
//    } else {
//        return "hey there"
//    }
    
    //usando guard let
    guard let middleName = name.middle else {
        return "hey there"
    }
    return "Hey, \(middleName)"
}

print(greetByMiddleName(fromFullName: ("LIZ", nil, "alpi")))

print(greetByMiddleName(fromFullName: ("liza", "viri", "alpi")))

func greetByMiddleNameBis(fromFullName name: (first: String, middle: String?, last: String)) -> String {
    //guard let middleFirstChar = middleName.first es lo mismo que middleName.first ?? " "
    guard let middleName = name.middle, middleName.count > 10, let middleFirstChar = middleName.first else {
        return "Hey there!"
    }
    return "Hey, \(name.first) \(middleFirstChar). \(name.last)"
}




func sortedEvenOddNumbersBis(_ numbers: [Int]) -> (even: [Int], odd: [Int]) {
    var even = [Int] ()
    var odd = [Int] ()
    
    for number in numbers {
        if number.isMultiple(of: 2) {
                  even.append(number)
                } else {
                    odd.append(number)
                }
    }
    return (even: even, odd: odd)
}

// valor que regresa la func anterior: ([Int]) -> ([Int], [Int])

let sortedNumber: ([Int]) -> ([Int], [Int]) = sortedEvenOddNumbersBis

print(sortedNumber([1,3,5,7,6,2,8,9]))



//: [Next](@next)
