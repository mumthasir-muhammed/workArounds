import UIKit

class VariadicClass {
    static func variadicParameterContainingMethod(vardiacParam: Int...) -> Int {
        return vardiacParam.reduce(0, +)
    }
}

// Variadic parameter with multiple integer elements
VariadicClass.variadicParameterContainingMethod(vardiacParam: 1,2,3,4,5)
// Variadic parameter with single integer element
VariadicClass.variadicParameterContainingMethod(vardiacParam: 10)
