//: [Previous](@previous)

import Foundation

var counter = 1

while counter < 10 {
    print(counter)
    counter += 1
}

print("while")
counter = 0
while 1...5 ~= counter {
    print(counter)
    counter += 1
}

print("repeat while")
repeat {
    print("counter: \(counter)")
    counter += 1
} while 1...5 ~= counter

//: [Next](@next)
