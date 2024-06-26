import UIKit

var array = [1,3,34,7,13,77,874,33]
array = array.sorted(by: <)
print(array)

let newarray = array.map { String($0) }
print(newarray)

let filteredArray = array.filter({ $0 % 2 == 0})
print(filteredArray)

let reduced = array.reduce("Combined number = ") { $0 + String($1) }
print(reduced)

var array2 = [1,3,34,nil,13,77,874,33,[11,111]] as [Any?]
array2 = array2.compactMap({ $0 })
print(array2)

