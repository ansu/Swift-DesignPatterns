//: Playground - noun: a place where people can play

import UIKit



func printApples(){
    print("printApples is running on = \(Thread.isMainThread ? "Main Thread":"Background Thread")")
    for i in 0..<3{
        print("🍏\(i)")
    }
}

func printStrawberries(){
    print("printStrawberries is running on = \(Thread.isMainThread ? "Main Thread":"Background Thread")")
    for i in 0..<3{
        print("🍓\(i)")
    }
}

func printBalls(){
    print("printBalls is running on = \(Thread.isMainThread ? "Main Thread":"Background Thread")")
    for i in 0..<3{
        print("🎱\(i)")
    }
}

//This would be a normal implementation without using GCD where everything runs on the main thread.

func testPrintMethods(){
    printApples()
    printStrawberries()
    printBalls()
}

/* Output
 printApples running on = Main Thread
 🍏0
 🍏1
 🍏2
 printStrawberries running on = Main Thread
 🍓0
 🍓1
 🍓2
 printBalls running on = Main Thread
 🎱0
 🎱1
 🎱2
 */



//Using one Dispatch Queue to run 3 tasks in a background thread


func queueTest1(){
    let queue = DispatchQueue(label: "com.knowstack.queue1")
    queue.async {
        printApples()
    }
    queue.async {
        printStrawberries()
    }
    queue.async {
        printBalls()
    }
    
}

//queueTest1()

/* Output - Note all the methods are running in the background thread, but as the same queue is being used they are running in serial.
 printApples is running on = Background Thread
 🍏0
 🍏1
 🍏2
 printStrawberries is running on = Background Thread
 🍓0
 🍓1
 🍓2
 printBalls is running on = Background Thread
 🎱0
 🎱1
 🎱2
 */


//Using three Dispatch Queue to run 3 different tasks in a background thread

func queueTest2(){
    let queue1 = DispatchQueue(label: "com.knowstack.queue1")
    let queue2 = DispatchQueue(label: "com.knowstack.queue2")
    let queue3 = DispatchQueue(label: "com.knowstack.queue3")
    queue1.async {
        printApples()
    }
    queue2.async {
        printStrawberries()
    }
    queue3.async {
        printBalls()
    }
    
}
//queueTest2()
/*
 Output - All the tasks are running in parallel
 
 printStrawberries is running on = Background Thread
 printApples is running on = Background Thread
 printBalls is running on = Background Thread
 🎱0
 🍓0
 🍏0
 🎱1
 🍓1
 🍏1
 🎱2
 🍓2
 🍏2
 */

// Using Dispatch Queue to run tasks on the main thread itself


func queueTest3(){
    let queue1 = DispatchQueue(label: "com.knowstack.queue1")
    let queue2 = DispatchQueue(label: "com.knowstack.queue2")
    let queue3 = DispatchQueue(label: "com.knowstack.queue3")
    queue1.sync {
        printApples()
    }
    queue2.async {
        printStrawberries()
    }
    queue3.async {
        printBalls()
    }
}


//queueTest3()

/*
 Output
 printApples is running on = Main Thread
 🍏0
 🍏1
 🍏2
 printStrawberries is running on = Background Thread
 printBalls is running on = Background Thread
 🍓0
 🎱0
 🍓1
 🎱1
 🍓2
 🎱2
 */

// Main Queue, Global Queue

func queueTest4(){
    let globalQueue = DispatchQueue.global()
    globalQueue.async {
        printApples()
    }
    globalQueue.async {
        printStrawberries()
    }
    globalQueue.async {
        printBalls()
    }
    
}

//queueTest4()

/* printApples is running on = Background Thread
 printBalls is running on = Background Thread
 🍏0
 printStrawberries is running on = Background Thread
 🎱0
 🍏1
 🍓0
 🎱1
 🍏2
 🍓1
 🎱2
 🍓2
*/


// Below code forces to run a task on the main thread on the global queue



func queueTest5(){
    let globalQueue = DispatchQueue.global()
    globalQueue.sync{
        printApples()
    }
    globalQueue.async {
        printStrawberries()
    }
    globalQueue.async {
        printBalls()
    }
    
}

//queueTest5()

/* printApples is running on = Main Thread
 🍏0
 🍏1
 🍏2
 printStrawberries is running on = Background Thread
 🍓0
 🍓1
 printBalls is running on = Background Thread
 🍓2
 🎱0
 🎱1
 🎱2
 */


// Below code runs the tasks on the main thread by using the main queue


func queueTest6(){
    let mainQueue = DispatchQueue.main
    mainQueue.async {
        printApples()
    }
    
    mainQueue.async {
        printStrawberries()
    }
    mainQueue.async {
        printBalls()
    }
}

queueTest6()