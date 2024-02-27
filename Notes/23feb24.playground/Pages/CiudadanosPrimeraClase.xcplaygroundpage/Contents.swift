//: [Previous](@previous)

import Foundation

//clases, estruturas y enumeradores

//Clases -> tipo referencia
class Vehicle {
    // propiedades almacenadas
    let brand: String
    let wheels: Int?
    
    var owner: String?
    var regNumber: String?
    
    //propiedad computadas
    var type: String {
        return(wheels ?? 0) > 0 ? "land" : "other"
    }
    
    var registration: (name: String, number: String)? {
        get{
            if let owner = owner, let regNumber  {
                return(owner, regNumber)
            }
            return nil
        }
        set(newRegistration) {
            if let newRegistration {
                owner = newRegistration.name
                regNumber = newRegistration.number
            }
        }
    }
    
    //constructor -> inicializador
    init(brand:String, wheels: Int = 4){
        self.brand = brand
        self.wheels = wheels
    }
    
    // funciones
    func stop(){
        print("Stop!")
    }
    func move(){
        print("On the road")
    }
}
let myVehicle = Vehicle(brand: "BMW")
//myVehicle.brand = "VW" no se puede porque es un let
myVehicle.owner = "Liz"
myVehicle.owner = "Viri"

let lalosVehicle = Vehicle(brand: "Ford")
lalosVehicle.owner = "Lalo"
lalosVehicle.owner

lalosVehicle.registration = ("viri", "12345")


// HERENCIA
class Car: Vehicle {
    
    //sobrecarga de variables -> debe ser el mismo tipo de dato
    override var type: String {
        return "Car"
    }
    //sobrecarga de inicializadores
    override init(brand: String, wheels: Int = 4) {
        super.init(brand: brand, wheels: 4)
    }
    convenience init(brand: String) {
        self.init(brand: brand, wheels: 4)
    }
    
    //sobrecarga de funciones
    override func move() {
        print("Car is on the road fast")
    }
    
    override func stop() {
        super.stop() // sirve para añadir lo mismo que la padre y otras cosas
        print("It is the traffic light on red")
    }
}

var myCar = Car(brand: "Mercedez-Benz")

var theirCar = myCar
theirCar.owner = "them"
myCar.owner

// en cuanto se cambie una porpiedad, es decir se modifica la referencia, por lo que no se puede  reasignar 
theirCar === myCar //igualdad de direcciones logicas
// ¿estas apuntando a la misma referencia

//: [Next](@next)
