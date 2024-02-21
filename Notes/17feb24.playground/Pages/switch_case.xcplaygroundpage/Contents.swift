//: [Previous](@previous)

import Foundation

var animal = "mouse"

switch animal {
case "dog","cat": print("it's a common pet 🐶🐱")
case "mouse": print("🐭")
default: break
}

var grade = 10
switch grade {
case ...5: print("😞")
case 6...9: print("😊")
case 9: print("🤓")
case 10: print("😎")
default:break
}

let color = (255, 230, 255)
switch color {
case let (r, g, 255) where r < 255:
    print("Max blue, g: \(g), r: \(r)") //constantes r-g
case (let r, 255, let b): print("Max green")
case (255, _, _): print("Max red")
default: print("random color")
}
//: [Next](@next)
/*var coordX: Double = 0
var coordY: Double = 0*/

var coordenada = (0.0, 3.5)
switch coordenada{
case let (coordX, coordY) where coordX > 0.0 && coordY > 0.0:
    print("Estás en el cuadrante 1")
case let (coordX, coordY) where coordX == 0.0 && coordY == 0.0:
    print("Estás en el origen")
case let (coordX, coordY) where coordX < 0.0 && coordY < 0.0:
    print("Estás en el cuadrante 2")
case let (coordX, coordY) where coordX == 0.0 && coordY > 0.0:
    print("La coordenada se encuentra sobre el eje Y")
case let (coordX, coordY) where coordX > 0.0 && coordY == 0.0:
    print("La coordenada se encuentra sobre el eje X")
default: print("Coordenada no válida")
}
