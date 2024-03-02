//: [Previous](@previous)

import Foundation

//Generics
let array: [Int] = []
let array1 = [Int]()
let array3 = Array<Int>()
let array4 = Array<String>()

//stack
//last in, first out
//push: agregar elementos - pop: obtener un elemento

//stack trabaja con un tipo de dato Element (definido por nosotros)
struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    func map<U>(_ transformer: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        
        for item in items {
            let transformedItems = transformer(item)
            mappedItems.append(transformedItems)
        }
        return Stack<U>(items: mappedItems)
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(5)
print(intStack.pop())
print(intStack.pop())
print(intStack.pop())
intStack.map { someint in
    String(someInt)
}

var stringStack = Stack<String>()
stringStack.push("a")
stringStack.push("b")
stringStack.push("lalo")

print(stringStack.items)

print(stringStack.pop())
print(stringStack.pop())
print(stringStack.pop())
print(stringStack.pop())


// map -> una transformacion
// itera sobre un arreglo, le aplica una transformación, a cada elemnto y nos devuelve un arreglo del mismo tamaño pero con lso elemntos transformados
func myMap<T, U>(_ items: [T], _ transformer: (T) -> U) -> [U] {
    var result = [U] ()
    
    for item in items {
        let transformedItem = transformer(item)
        result.append(transformedItem)
    }
    return result
}

let myStrings = ["one", "two", "three"]

let myStringLenghts = myMap(myStrings) { someString in
    return someString.count
}

print(myStringLenghts)

let myNumbers = [1,2,3,4,5]

let myNumbersString = myMap(myNumbers) { number in
    String(number)
}
print(myNumbersString)

