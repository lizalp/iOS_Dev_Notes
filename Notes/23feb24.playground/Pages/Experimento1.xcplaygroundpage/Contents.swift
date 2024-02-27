//: [Previous](@previous)

import Foundation
// ejecutar la siguiente operacion (mostrar decimales)
// (6 + (4 * (8 - 1))) / 2

enum ArithmeticExpression {
    case number(Double)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case substraction(ArithmeticExpression, ArithmeticExpression)
    indirect case mult(ArithmeticExpression, ArithmeticExpression)
    indirect case division(ArithmeticExpression, ArithmeticExpression)

}

func eval(expression: ArithmeticExpression) -> Double {
    switch expression {
    case let .number(value): return value
    case let .addition(left, right): return eval(expression: left) + eval(expression: right)
    case let .substraction(left, right): return eval(expression: left) - eval(expression: right)
    case let .mult(left, right): return eval(expression: left) * eval(expression: right)
    case let .division(left, right): return eval(expression: left) / eval(expression: right)
    }
}

let eight = ArithmeticExpression.number(8.0)
let one = ArithmeticExpression.number(1.0)
let four = ArithmeticExpression.number(4.0)
let six = ArithmeticExpression.number(6.0)
let two = ArithmeticExpression.number(2.0)
let resta = ArithmeticExpression.substraction(eight, one)
eval(expression: resta)
let mult = ArithmeticExpression.mult(four, resta)
eval(expression: mult)
let suma = ArithmeticExpression.addition(six, mult)
eval(expression: suma)
let divi = ArithmeticExpression.division(suma, two)
eval(expression: divi)

// version resumida
let minus = ArithmeticExpression.substraction(ArithmeticExpression.number(8.0), ArithmeticExpression.number(1.0))
eval(expression: resta)
let multi = ArithmeticExpression.mult(ArithmeticExpression.number(4.0), minus)
let sumita = ArithmeticExpression.addition(ArithmeticExpression.number(6.0), multi)
let divisioncita = ArithmeticExpression.division(sumita, ArithmeticExpression.number(2.0))
eval(expression: divisioncita)

//: [Next](@next)
