//: Playground - noun: a place where people can play

import UIKit



protocol Observer {
    func update(_ value:String)
}

class ConcreteObserver:Observer {
    
    var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func update(_ value:String) {
        print(id + " observered the subject's state was changed." + value)
    }
    
}

class Subject {
    var observers:[Observer] = []
    
    var state:String {
        didSet {
            notify()
        }
    }
    init(state: String) {
        self.state = state
    }
    func attachObserver(_ observer:Observer){
        self.observers.append(observer)
    }
    
    func notify(){
        for observer in observers {
            observer.update(state)
        }
    }
}

let subject = Subject(state: "Ansu")
let observerA = ConcreteObserver(id: "A")
let observerB = ConcreteObserver(id: "B")

subject.attachObserver(observerA)
subject.attachObserver(observerB)

subject.state = "Jain"


