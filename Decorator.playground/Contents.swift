//: Playground - noun: a place where people can play

import UIKit

protocol Product {
    
    func price() -> Int
    func name() -> String
}

class FullPriceProduct : Product {
    
    func price() -> Int {
        return 100
    }
    
    func name() -> String {
        return "Ansu"
    }
}

class DiscountedProduct :Product {
    
    private let product:Product
    
    init (product:Product){
        self.product = product
    }
    
    func price() -> Int {
        return Int(Double(product.price()) * 0.75)
    }
    
    func name() -> String {
        return product.name()
    }
}


class CheckoutManager {
    static let shared = CheckoutManager()
    private init() {}
    
    func checkout(product:Product){
        let name = product.name()
        let price = product.price()
        print("charging custoemr \(price) for \(name)")
    }
    
}


let fullPriceProduct = FullPriceProduct()
let discountedProduct = DiscountedProduct(product: fullPriceProduct)

CheckoutManager.shared.checkout(product: fullPriceProduct)
CheckoutManager.shared.checkout(product: discountedProduct)


