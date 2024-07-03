import UIKit

class VardiacClass {
    static func varidiacParameterContainingMethod(vardiacParam: Int...) -> Int {
        return vardiacParam.reduce(0, +)
    }
}

// Vardiac parameter with multiple integer elements
VardiacClass.varidiacParameterContainingMethod(vardiacParam: 1,2,3,4,5)
// Vardiac parameter with single integer element
VardiacClass.varidiacParameterContainingMethod(vardiacParam: 10)
