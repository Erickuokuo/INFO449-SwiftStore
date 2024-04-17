//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String { get }
    func price() -> Int
}

class Register {
    var receipt: Receipt
        init() {
           receipt = Receipt()
       }
       
        func scan(_ item: SKU) {
           receipt.itemsList.append(item)
       }
    
        func subtotal() -> Int {
            return receipt.total()
        }
        
        func total() -> Receipt {
            let finishedTransaction = receipt
            receipt = Receipt()
            return finishedTransaction
    }
}


class Receipt {
    var itemsList: [SKU] = []
      
    func items() -> [SKU] {
        return itemsList
    }
    func total() -> Int {
        return itemsList.reduce(0) { $0 + $1.price() }
    }
    
    func output() -> String {
        var receiptString = "Receipt:\n"
        for item in itemsList {
            receiptString += "\(item.name): $\(Double(item.price()) / 100)\n"
        }
        receiptString += "------------------\n"
        receiptString += "TOTAL: $\(Double(total()) / 100)"
        return receiptString
    }

  }


class Item: SKU {
    let name: String
    let priceEach: Int

    init(name: String, priceEach: Int) {
        self.name = name
        self.priceEach = priceEach
    }

    func price() -> Int {
        return priceEach
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

