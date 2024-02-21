import Foundation

var animal = "dog"
guard animal == "dog" else { fatalError("It's not a dog!")}

// create a function
func checkOddEven() {
  var number = 23

  // use of guard statement
  guard number % 2 == 0 else {
    
    print("Odd Number")
    return
  }

  print("Even Number")
}

// function call
checkOddEven()


