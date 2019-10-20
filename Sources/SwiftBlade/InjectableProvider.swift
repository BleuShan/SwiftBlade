//
//  InjectableProvider.swift
//  
//
//  Created by Philippe Lafontaine on 2019-10-20.
//

public protocol InjectableProvider : TypeIdentifiable, AnyObject {
    associatedtype Output
    
    func get() -> Self.Output
}


extension InjectableProvider {
    public var typeId: TypeIdentifier {
        get {
            TypeIdentifier(Output.self)
        }
    }
}
