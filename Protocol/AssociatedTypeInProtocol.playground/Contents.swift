import UIKit

protocol Stack {
    associatedtype DataType
    var items: [DataType] { get set }
    mutating func pushItem(item: DataType)
}

extension Stack {
    mutating func pushItem(item: DataType) {
        self.items.append(item)
    }
}


struct NamesDB: Stack {
    var items = [Int]() // Since 'items' is an associated type, we can fill it with any type.
}

var obj = NamesDB()
obj.pushItem(item: 111)
obj.pushItem(item: 222)
print(obj)
