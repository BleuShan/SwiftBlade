//
//  AnyInjectableProvider.swift
//  
//
//  Created by Philippe Lafontaine on 2019-10-20.
//

public final class AnyInjectableProvider<T>: InjectableProvider {
    public typealias Output = T
    
    private let getImpl: () -> T
    
    internal init<P>(_ provider: P) where P : InjectableProvider, P.Output == T {
        getImpl = provider.get
    }
    
    public func get() -> T {
        return getImpl()
    }
}
