//: [Previous](@previous)

import Foundation
//Functional programming
//first-class function
//pure functions : reciben y regresan algo, pero no modifican
//inmutability: se observan en las constantes let tambien se observa en los structs
// string type: que se deba de definir tipo de contantes

//Methods
// map: itera sobre un arreglo y devuelve un arreglo dels mismo tamaño, pero con los elemntos transformados
let volunteersAvarages = [10.5, 4.3, 7.6, 8.4, 2.1]
let roundedVolunteerAvarages = volunteersAvarages.map({(avarge: Double) -> Int in return Int(avarage)
})

let roundedVolunteerAvarages2 = volunteersAvarages.map{ Int($0) }

print(roundedVolunteerAvarages)

//filter: oitera sobre un arreglo y nos devuelvo un arreglo del mismo "tipo" pero puede ser de un tamaño menor
let volunteersAvaragesFilter = [10.5, 4.3, 7.6, 8.4, 2.1]

let invitedVolunteers = volunteersAvaragesFilter.filter{ average: Double -> Bool in
    return average > 5
}

let invitedVolunteers2 = volunteersAvaragesFilter.filter{ $0 < 5 }

//reduce
//itera sobre un arreglo y devuelve un unico valor significativo del arreglo
let volunteersAvaragesReduce = [10.5, 4.3, 7.6, 8.4, 2.1]

let totalVolunteers = volunteersAvaragesReduce.reduce(0) { partialResult, avarage in
    return partialResult + avarage
}
print(totalVolunteers)

//map, filter, reduce se les conoce como high order function




//: [Next](@next)
