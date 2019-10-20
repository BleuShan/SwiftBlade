//
//  TypeIdentifier.swift
//  
//
//  Created by Philippe Lafontaine on 2019-10-20.
//

public struct TypeIdentifier : Hashable {
    private let ty: String
    init(_ item: Any) {
        if let tid = item as? TypeIdentifiable {
            self = tid.typeId
        } else {
            let mirror = Mirror(reflecting: item)
            ty = String(reflecting: mirror.subjectType)
        }
    }
    
    init<T>(_ ty: T.Type) {
        self.ty = String(reflecting: ty)
    }
    
    public static func == (lhs: TypeIdentifier, rhs: TypeIdentifier) -> Bool {
        lhs.ty == rhs.ty
    }
    
    public func hash(into hasher: inout Hasher) {
        ty.hash(into: &hasher)
    }
}
