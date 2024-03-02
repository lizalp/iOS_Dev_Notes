//: [Previous](@previous)

import Foundation

//Protocolos -> contrato
//forma de encapsulacion: separación de responsabilidades del objeto

protocol TableDataSource {
    var numberOfRow: Int { get } //leer
    var numberOfColumns: Int { get } //leer y asignar {get set}
    
    func label(forColumn column: Int) -> String
    func itemFor(row:Int, column: Int) -> String
}

//Tablas: es un arreglo de arreglos
func printTable(_ dataSource: TableDataSource) {
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
struct Department: TableDataSource {
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

var department = Department(name: "Policy", people: [])
department.add(Person(name: "Liz", age: 25, vacationDays: 30))
department.add(Person(name: "Eli", age: 32, vacationDays: 40))
department.add(Person(name: "Eva", age: 31, vacationDays: 21))

//printTable(data, headings: ["name", "age", "vacation days"])

printTable(department)

//: [Next](@next)
