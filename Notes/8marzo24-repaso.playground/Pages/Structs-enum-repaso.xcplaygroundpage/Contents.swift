//Estructuras
//literalmente son copias
// no heredan
// no se necesita init, son opcionales

struct Dog {
    var name: String
    
}

let myDog = Dog(name: "Roco")

extension Dog {
    init() {
        name = "Chilaquiles"
    }
}

var hisDog = myDog
hisDog.name = "nieve"
hisDog.name
myDog.name


//ENUM
//casos bien definidos
enum Animal {
    case owl(name: String)
    case cat(nice: Bool)
    case dog
    
    //todas las propiedades del enum son calculadas
    var emoji: String {
        //Self: se utiliza para variables estaticas
        switch self {
        case .owl: return "🦉"
        case .cat: return "🐱"
        case .dog: return "🐶"
        default: return "🥸"
        }
    }
}

var myAnimal = Animal.owl(name: "Cafe")

switch myAnimal {
case .owl(let name) : print(name)
case .cat(let nice) : nice ? print("It's nice") : print("It's mean")
default: break
}

//raw value
//es un opcional
enum Vehicle: Int{
    //los inicializadores son opcionales
    // los valores por default de cada caso deben ser unicos
    case car = 1
    case bike = 5
}
