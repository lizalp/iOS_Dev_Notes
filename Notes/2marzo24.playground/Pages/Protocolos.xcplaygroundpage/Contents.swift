//: [Previous](@previous)

import Foundation

//Protocolos -> contrato
//forma de encapsulacion: separación de responsabilidades del objeto

//a parte del protocolo que yo defini,
// tambien tomo la definicion del protocolo de customstring
protocol TableDataSource: CustomStringConvertible {
    var numberOfRow: Int { get } //leer
    var numberOfColumns: Int { get } //leer y asignar {get set}
    
    func label(forColumn column: Int) -> String
    func itemFor(row:Int, column: Int) -> String
}

//Tablas: es un arreglo de arreglos
func printTable(_ dataSource: TableDataSource & CustomStringConvertible) {
    var headerRow = "|"
    var columnWidths = [Int] ()
    
    for columnIndex in 0..<dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: columnIndex)
        let columnHeader = " \(columnLabel) |"
        columnWidths.append(columnLabel.count)
        headerRow += columnHeader
    }
    
    print(headerRow)
    
    for rowIndex in 0..<dataSource.numberOfRow {
        var output = "|"
        for rowColumnIndex in 0..<dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: rowIndex, column: rowColumnIndex)
            let paddingNeeded = columnWidths[rowColumnIndex] - item.count
            let padding = repeatElement(" ", count: paddingNeeded).joined()
            output += " \(padding)\(item) |"
        }
        print(output)
    }
}

let data = [
    ["liz", "25", "6"],
    ["ale", "30", "12"],
    ["eva", "26", "12"]
]
//en lugar de ese arreglo, definirimos una estrutura

struct Person {
    let name: String
    let age: Int
    let vacationDays: Int
}

//para que nuestra estructura conforme al protocolo
struct Department {
    let name: String
    var people: [Person]
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    var numberOfRow: Int { people.count }
    var numberOfColumns: Int { 3 }
    
    func label(forColumn column: Int) -> String {
        let label: String
        
        switch column {
        case 0: label = "Name"
        case 1: label = "Age"
        case 2: label = "Vacation Days"
        default: fatalError("Invalid column")
        }
        return label
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        let item: String
        
        switch column {
        case 0: item = person.name
        case 1: item = "\(person.age)"
        case 2: item = "\(person.vacationDays)"
        default: fatalError("Invalid row")
        }
        return item
    }
}

// MARK: - You made the Department type conform to the CostumSringConvertible protocol
extension Department: CustomStringConvertible {
    var description: String {
        return "Department: \(name)"
    }
}

var department = Department(name: "Policy", people: [])
department.add(Person(name: "Liz", age: 25, vacationDays: 30))
department.add(Person(name: "Eli", age: 32, vacationDays: 40))
department.add(Person(name: "Eva", age: 31, vacationDays: 21))

//printTable(data, headings: ["name", "age", "vacation days"])

//printTable(department)

//que tipos pueden comformar protocolos??
// enum, class, struct

// s epueden conformar multiples protcolos??
// si es posible

//ejemplo: print conforma un protocolo
// el protocolo es CustumStringConvertible
print(department)

// can a classs inherit and conform to a protocol?
// si se puede

//let operationalDataSource: TableDataSource = Department(name: "HR", people: [])
let hrDepartment = department as Department

//as, as? opcional, as! forzado

let mike = Person(name: "Mike", age: 24, vacationDays: 6)
mike is TableDataSource
mike is Person

hrDepartment is TableDataSource //porque Department conforma TableDataSource



//: [Next](@next)

