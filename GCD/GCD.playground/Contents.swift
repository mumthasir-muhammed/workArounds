import UIKit

let queue1 = DispatchQueue(label: "myDispatch1", qos: .background)
let queue2 = DispatchQueue(label: "myDispatch2", qos: .userInteractive)

//queue1.async {
//    for i in 1...10 {
//        print("😀\(i)")
//    }
//}
//
//queue2.async {
//    for i in 10...20 {
//        print("🥶\(i)")
//    }
//}
//
//
//for i in 20...30 {
//    print("😡\(i)")
//}

// Concurrent Queue
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
concurrentQueue.async {
    for i in 1...10 {
        print("🤢\(i)")
    }
}

concurrentQueue.async {
    for i in 1...10 {
        print("😈\(i)")
    }
}

for i in 20...30 {
    print("😡\(i)")
}
