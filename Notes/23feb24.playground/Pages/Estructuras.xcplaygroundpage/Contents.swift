//: [Previous](@previous)

import Foundation

// las estrcuturas son ciudadanos de primera clase
//estructuras no heredan
//propiedades almacenadas
struct Dog {
    var name: String {
        //observer
        willSet(newName) {
            print("my new name is \(newName). Original: \(name)")
        }
        didSet {
            print("my old name is \(oldValue). My name: \(name)")
        }
    }
    var adopted: Bool
    
    init(adopted name: String){
        self.adopted = true
        self.name = name
    }
    
    init(bought name: String){
        self.init(name: name, isAdopted: false)
    }
    
    init(name: String, isAdopted: Bool){
        self.name = name
        self.adopted = isAdopted
    }
    
}

var dante = Dog(name: "Dante", isAdopted: true)
dante.name = "Rayito"
dante.name
var yourDog = dante
yourDog.name = "Coquito"
yourDog.name
var theirDog = Dog(adopted: "Roco")
let hisDog = Dog(bought: "Kyra")


struct Temperature {
    static let boilingPoint = 100
}

//accedemos a la propiedad de tipo(estructura)
Temperature.boilingPoint
//: [Next](@next)
