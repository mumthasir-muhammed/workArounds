import UIKit


func performSomeoperation(a: Int, b: Int, operation: (Int, Int) -> Int ) -> Int {
    return operation(a, b)
}

let addOperation: (Int, Int) -> Int = { (a,b) in
    return a + b
}


let subOperation: (Int, Int) -> Int = { (a,b) in
    return a - b
}

let mulOperation: (Int, Int) -> Int = { (a,b) in
    return a*b
}

performSomeoperation(a: 10, b: 10, operation: addOperation)
performSomeoperation(a: 20, b: 10, operation: subOperation)
performSomeoperation(a: 20, b: 10, operation: mulOperation)
