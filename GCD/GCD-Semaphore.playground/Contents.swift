import UIKit

// Create a semaphore with an initial value of 1
let semaphore = DispatchSemaphore(value: 1)

// Shared resource
var resourceCounter = 0

// Concurrent tasks
func taskOne() {
    semaphore.wait() // Acquire the semaphore permit
    for _ in 1...5 {
        resourceCounter += 1
        print("Task One: \(resourceCounter)")
    }
    semaphore.signal() // Release the semaphore permit
}

func taskTwo() {
    semaphore.wait() // Acquire the semaphore permit
    for _ in 1...5 {
        resourceCounter -= 1
        print("Task Two: \(resourceCounter)")
    }
    semaphore.signal() // Release the semaphore permit
}

// Create a concurrent queue
let concurrentQueue = DispatchQueue(label: "com.exp.conQueue", attributes: .concurrent)

// Run the tasks concurrently
concurrentQueue.async {
    taskOne()
}

concurrentQueue.async {
    taskTwo()
}
