//
//  TypeIdentifiable.swift
//  
//
//  Created by Philippe Lafontaine on 2019-10-20.
//

public protocol TypeIdentifiable {
    var typeId: TypeIdentifier { get }
}

extension TypeIdentifiable {
    public var typeId: TypeIdentifier {
        get {
            TypeIdentifier(self)
        }
    }
}
