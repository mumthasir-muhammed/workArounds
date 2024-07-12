import UIKit

class VariadicClass {
    // A method with Variadic parameter
    // Variadic parameter can be identified by succeeding three dots after paramter type, thats it.
    static func variadicParameterContainingMethod(vardiacParam: Int...) -> Int {
        // Here we are using 'reduce' higher order function to calculate the sum of parameters receieved 
        return vardiacParam.reduce(0, +)
    }
}

// Variadic parameter with multiple integer elements
VariadicClass.variadicParameterContainingMethod(vardiacParam: 1,2,3,4,5,100)
// Variadic parameter with single integer element
VariadicClass.variadicParameterContainingMethod(vardiacParam: 10)
