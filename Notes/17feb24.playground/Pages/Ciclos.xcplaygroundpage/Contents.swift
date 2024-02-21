//: [Previous](@previous)

import Foundation

for index in 1...5 {
    print(index)
}

let numbers = [1, 2, 3, 4, 5, 6, 7]
for number in numbers {
    print(number)
}


let colors = ["red": "rojo", "pink": "rosa", "green": "verde", "purple": "morado"]

// utilizamos tupla para recorrer cada elemento del diccionario
for (nameEN, nameES) in colors {
    print("Color \(nameEN) in spanish is \(nameES) ")
}

//utilizando propiedades key y value
for colorTranslate in colors {
    print("Color \(colorTranslate.key) in spanish is \(colorTranslate.value) ")
}

let names: Set = ["Alan", "Ana", "Omar", "Elif", "Elena"]
var index = 0
for _ in names {
    print(index)
    index += 1
}

for(index, name) in names.enumerated() {
    print("\(name) is number \(index)")
}

for (index, (type,name)) in colors.enumerated() {
    print("\(index), color \(type) in spanish is \(name) ")
}

for (index, colorTranslate) in colors.enumerated() {
    print("\(index), color \(colorTranslate.key) in spanish is \(colorTranslate.value) ")
}

for (index, name) in names.enumerated() {
    if index % 2 == 0{
        print("\(name) is \(index)")
    }
}

for (index, name) in names.enumerated() {
    if index % 2 == 0{
        continue
    } else {
        print(index)
    }
}

for colorTranslate in colors where colorTranslate.key == "pink" {
    print(colorTranslate.value)
}

//ejercicio
let intervals = stride(from: 0, through: 60, by: 15)
for number in intervals {
    print(number)
}

let intervalsUpToLast = stride(from: 0, to: 20, by: 5)
for number in intervalsUpToLast {
    print("up to last \(number)")
}

let intervalsThroughLast = stride(from: 0, through: 20, by: 5)
for number in intervalsThroughLast {
    print("through last \(number)")
}
//: [Next](@next)
