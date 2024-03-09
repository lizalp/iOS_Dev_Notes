// protocolos son genericos??? NO!
// la forma de hacerlos sería con ASSOCIATED TYPES

// los protocolos
//Iterator protocol
// sequence -> permiten hacer ciclos for in sencillos
// ya estan definidos en libreria estandard en swift

//protocol IteratorProtocol {
//    associatedtype Element
//    
//    mutating func next() -> Element?
//}
//
//protocol Sequence {
//    //elemento de tipo iterator que conforme a iterator protocol
//    associatedtype Iterator: IteratorProtocol
//    //cada uno de los elementos sea igual al definido de iTERATOR que a su vez conforma a iTERATORpROTOCOL
//    associatedtype Element where Element == Iterator.Element
//    
//    func makeIterator() -> Iterator
//    
//}

//T,U -> T de type y U de que es la secuencia en orden alfab despues de t
struct Stack<Element>: Sequence {
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
    
    func makeIterator() -> StackIterator<Element> {
        //hace copia de estrutura e itera sobre ella
        return StackIterator(stack: self)
    }
}

struct StackIterator<T>: IteratorProtocol {
    //typealias Element = T -> PODEMOS REMPLAZAR DIRECTAMENTE POR T y swift lo infiere automaticamente
    
    var stack: Stack<T>
    
    mutating func next() -> /*Element?*/ T? {
        return stack.pop()
    }
}

var myStack = Stack<Int>()

var myStackIterator = StackIterator(stack: myStack)

//while let value = myStackIterator.next() {
//    print("\(value)")
//}

for value in myStack {
    print("\(value)")
}
