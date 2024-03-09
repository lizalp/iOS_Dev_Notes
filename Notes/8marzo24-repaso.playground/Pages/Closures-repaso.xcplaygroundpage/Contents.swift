let someArray: [Int] = [2,5,4,7,9]

let sortedArray = someArray.sorted(by: { (lhs, rhs) in
    lhs < rhs
})

print(sortedArray)

//operadores booleanos internamente en Swift están definidos como una función, de ahi que podamos colocarlo de la siguiente manera

//closures: son funciones sin nombre, ciertas funciones que s epuede simplificar, captura variables a su alrededor
let sortedArray2 = someArray.sorted(by: < )

func runClosure(closure: (String) -> ()) {
    let names = ["a","e","i"]
    for name in names {
        closure(name)
    }
}

runClosure(closure: { name in
    print(name)
})

//protocolos
//contrato
//hacer apps

struct Car: CustomStringConvertible, Equatable {
    var name: String
    var description: String {
        "My car is \(name)"
    }
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.name == rhs.name
    }
}



//print
let myCar = Car(name:"Toledo")
print(myCar)
let otherCar = Car(name: "Ibiza")
print(myCar == otherCar) //aparece error porque == no sabe como interpretar el customstring, por lo que hacemos uso de otro protocolo llamado Equatable y definimos una funcion

//clases
// tipo de dato referenciado

class Vehicle {
    var brand: String //propiedad almacenada: estara akmacenando un dato -> ahi solo existen los observadores
    var wheels: Int?
    var owner: String? {
        willSet (newOwner) {
            print("Current value is \(owner) new value is \(newOwner)")
        }
        didSet {
            print("Current value is \(owner) new value is \(oldValue)")
        }
    }
    //propiedades computadas
    var type: String {
        get {
            if let wheels, wheels > 0 {
                return "land"
            } else {
            return "other"
            }
        }
    }
    
    var registration: String {
        get { return owner ?? "No owner"}
        set { self.owner = newValue }
        
    }
    
    //inicializadores: indican como se construye el objeto
    // es un contructor
    //TIPOS DE INCIIALIZADORES
    
    //DESIGNADO
    init(brand: String, wheels: Int?) {
        self.brand = brand
        self.wheels = wheels
    }
    

    //CONVINIENCE
    convenience init() {
        self.init(brand: "Seat", wheels: 4)
    }
    
    func move() {
        
    }
    
    //reglas de inicializadores
    //convenience llama a convinience
    //convinience debe llamar si o si designated
    //un designated debe llamar a un designated padre
    // super init
    // self init
}

var myCar2 = Vehicle(brand:"Seat", wheels: nil)
myCar2.brand


//unwrapped opcionales
//if let wheels = myCar2.wheels {
//    //wheels es de tipo Int
//    //ejecuta solo si wheels tiene un valor
//}

//el guard let, es mas comun utilizar en funciones
//guard let wheels = myCar2.wheels else { fatalError()}

//operador ternario
let wheels = myCar2.wheels != nil ? myCar2.wheels! : 0

//nil coelasing
//let wheels2 = myCar2.wheels ?? 0


//ARC Automatic Reference Counting ->> revisa las referencias

