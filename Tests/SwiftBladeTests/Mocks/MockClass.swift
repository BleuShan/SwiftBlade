//
//  MockClass.swift
//  
//
//  Created by Philippe Lafontaine on 2019-10-20.
//

class MockClass {
   private var count = 0
   
   public var message: String {
       return "Hi subscriber: \(count)"
   }
   
   public func subscribe(subscriber: Any) {
       count += 1
   }
   
   public func unsubscribe(subscriber: Any) {
       count -= 1
   }
}
