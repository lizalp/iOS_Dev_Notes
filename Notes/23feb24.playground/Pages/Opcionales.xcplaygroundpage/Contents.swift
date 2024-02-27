//: [Previous](@previous)

import Foundation

var phone: String = "5535833511"
var landline: String? = nil

if let landline{
    print(landline)
}

// lo anterior seria lo mismo a if let landline2 = landline {}
guard let landline else { fatalError() }
print(landline ?? "No landaline")

landline=nil
print(landline ?? phone)

//force unwrap
landline != nil ? landline! : phone




//: [Next](@next)
