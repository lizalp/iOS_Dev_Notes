import UIKit
import Foundation

var animal = "dog"

if animal == "dog" {
    print("it's a 🐶")
} else {
    print("it's another animal")
}

if !(animal == "dog") {
    print("it's another animal")
} else {
    print("it's a 🐶")
}

if animal.count < 4 {
    print("less than 4 letters")
} else {
    print("too many")
}

//or: una  de las condiciones debe ser TRUE
if animal == "dog" || animal == "cat" {
    print("common pet")
} else {
    print("what is it?!")
}

//and: ambas condiciones deben ser TRUE
if animal == "dog" && animal == "cat" {
    print("common pet")
} else {
    print("what is it?!")
}

var number = 2

//bloque de if completo
//todo está unido, y valida lo primero que sea true
if animal == "cat" {
    print("it's a 🐱")
} else if number == 2 {
    print("number 2")
} else {
    print("unrelated")
}

//validar version de SO
if #available(iOS 16.6, *) {
    // solo para ese iOS +
} else {
    //codigo para SO anterior a 16.6
}

if #unavailable(iOS 16.6){
    //codigo para SO anterior
}

//operador ternario
var value = number == 2 ? "It's number 2" : "others"

var exampleValue: Int
if number == 2 {
    //exampleValue = "Number"
} else {
    //exampleValue = "Others"
}

//ejercicio 1
var weather: String = "lluvia"
var time: Int = 3

if weather == "nieve" {
    print("🌨️")
} else if weather == "lluvia" {
    print("⛈️")
}
// con operador ternario
weather == "nieve" ? "🌨️" : "⛈️"

if time >= 7 && time <= 18 {
    print("Usa bloqueador")
} else if time>=0 && time <= 6 || time >= 19 && time <= 23 {
    print("No necesitas bloqueador")
}

//otras soluciones
var dark = Array(0...6) + Array(19...23)
var light = 7...18

/*
if light ~= time {
    print("Usa bloqueador")
} else if dark.contains(where: {
    //que ira aqui??
}) {
    print("no necesitas bloqueador")
}
*/


