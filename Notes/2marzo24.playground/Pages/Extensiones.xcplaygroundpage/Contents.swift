//: [Previous](@previous)

import Foundation

//Extension
//Can be used:
//- add computed properties
//- add new initaliazers
// protocol confotmance
//new methods
//embedded types

// Double -> squared

extension Double {
    var squared: Double { self * self}
}

let sideLenght: Double = 2.0
let squaredSideLenght = sideLenght * sideLenght
let squaredSideLenght2 = sideLenght.squared

struct Car {
    let maker: String
    let model: String
    let year: Int
    var fuelLevel: Double {
        willSet {
            //checa que la cond que pasas como primer param sea valida
            //antes de asignar valor a la variable
            // sino se cumple, arroja mensaje y se crashea
            //precondition en cualquier parte del codigo
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1")
        }
    }
}

// MARK: - Conformance to Custum String Convertible
//extensiones son exepciones de acceso a las variables privadas -> se cumple solo para el mismo archivo
extension Car: CustomStringConvertible {
    var description: String {
        return "My car is: \(maker) \(model)"
    }
}

// MARK: - Create new initalizers
// ventaja de init en extension: no perdemos el inicializador por defecto que crea swift automaticamente(member wise)
extension Car {
    init(maker: String, model: String, year: Int){
        self.init(maker: maker, model: model, year: year, fuelLevel: 1)
    }
}

// MARK: - Create nested types
extension Car {
    enum Era {
        case modern, vintage, veteran
    }
    var era: Era {
        let eraToReturn: Era
        
        switch year {
        case ...1986: eraToReturn = .veteran
        case 1897...1919: eraToReturn = .vintage
        default: eraToReturn = .modern
        }
        return eraToReturn
    }
}

var firstCar = Car(maker: "Seat", model: "Leon", year: 2024, fuelLevel: 1)
print(firstCar.era)

// MARK: - Add new method
extension Car {
    //como struct es inmutable, mutating sirve par amodificar una propidad inmutable
    mutating func emptyFuel(by amount: Double) {
        precondition(amount <= 1 && amount >= 0, "Amount to rmeove must be between 0 and 1")
        fuelLevel -= amount
    }
    mutating func fillFuel() {
        fuelLevel = 1.0
    }
}

//DYNAMIC --> objective-c
//swizziling a method
extension Int {
    var isEven: Bool {
        self.isMultiple(of: 2) ? true : false
    }
    var isOdd: Bool {
        !self.isMultiple(of: 2) ? true : false
    }
}


//: [Next](@next)
