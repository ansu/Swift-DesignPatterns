//: Playground - noun: a place where people can play
// https://medium.com/@duyquang91/prototype-design-pattern-in-swift-4e798ec40b38
//The prototype pattern is used to instantiate a new object by copying all of the properties of an existing object, creating an independent clone. This practise is particularly useful when the construction of a new object is inefficient.

import UIKit

class SmartPhone {
    
    var name: String
    var color: String
    var capacity: Int
    
    // Designed Initializer
    init(name: String, color: String, capacity: Int) {
        self.name = name
        self.color = color
        self.capacity = capacity
        
    }
    
    // Prototype pattern in action
    func clone(name: String? = nil, color: String? = nil, capacity: Int? = nil) -> SmartPhone {
        let cloneName = name == nil ? self.name : name!
        let cloneColor = color == nil ? self.color : color!
        let cloneCapacity = capacity == nil ? self.capacity : capacity!
        
        return SmartPhone(name: cloneName, color: cloneColor, capacity: cloneCapacity)
    }
}

var iPhone7Gray16G    = SmartPhone(name: "iPhone 7", color: "Gray", capacity: 16)
var iPhone7Gray64G    = iPhone7Gray16G.clone(capacity: 64)
var iPhone7White64G   = iPhone7Gray64G.clone(color: "White")
var samsungS8White64G = iPhone7White64G.clone(name: "Samsung S8")
var samsungS8Blue64G  = samsungS8White64G.clone(color: "Blue")