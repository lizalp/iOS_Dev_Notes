//: [Previous](@previous)

import Foundation

enum AnimalType: String, CaseIterable {
    //CaseIterable: itera en cada uno de los elemntos
    // es un protocolo
    
    case mammal = "otra cosa"
    case bird, reptile
    
    // los valores asociados al case deben de ser unicos
    // es decir que no podría aver bird = "otra cosa"
    
    var cadena: String {
        switch self {
        case .bird: return "aves"
        case .mammal: return "mamifero"
        case .reptile: return "reptil"
        }
    }
}

var type1 = AnimalType.bird
type1.cadena
type1.rawValue
var type2: AnimalType = .reptile
AnimalType.mammal.rawValue

var arrAnimalTypes: [AnimalType] = [.mammal, .reptile, .bird]
AnimalType.allCases

for type in AnimalType.allCases {
    print(type.cadena)
}

enum Pet: String {
    case dog = "🐶"
    case cat = "🐱"
    case mouse = "🐭"
    case chicken = "🐥"
    case cocodrile = "🐊"
    
    var type: AnimalType {
        //self -> se refiere ya al objeto
        switch self {
        case .dog, .cat, .mouse: return .mammal
        case .chicken: return .bird
        case .cocodrile: return .reptile
        }
    }
    
    init?(name: String) {
        //si el inicializador falla, que regrese nil
        switch name {
        case "dog": self.init(rawValue:"🐶")
        case "cat": self = .cat
        default: return nil
        }
       
    }
}

var myPet: Pet = .dog
myPet.rawValue

var yourPet = Pet(rawValue: "🙊")
yourPet

var theirPet = Pet(name: "dog")
theirPet
Pet(name: "cat")

switch theirPet {
case .dog: print("doggo")
case .cat: print("cathy")
default: break
}

enum ContactMethod {
    case email(String)
    case phone(Int)
    case addres(streetName: String, zipCode: String, streetNum: String)
    
    var value: String {
        switch self {
        case .email(let string): return string
        case .phone(let no): return "\(no)"
        default: return ""
        }
    }
}

var myEmail = ContactMethod.email("liz@gmail.com")
var yourMail = ContactMethod.email("omar@gmail.com")
var myPhone = ContactMethod.phone(12345)
myEmail.value
yourMail.value
myPhone.value

myEmail = myPhone
switch myEmail{
case .email(let string): print(string)
case .phone(let int): print(int)
case .addres(let streetName, let zipCode, let streetNum): print(streetName + zipCode + streetNum)
}

//enumeraciones recursivas -> indirect
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case substraction(ArithmeticExpression, ArithmeticExpression)

}

func eval(expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value): return value
    case let .addition(left, right): return eval(expression: left) + eval(expression: right)
    case let .substraction(left, right): return eval(expression: left) - eval(expression: right)
    }
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let sum2 = ArithmeticExpression.addition(sum, sum)
eval(expression: sum2)
//: [Next](@next)
