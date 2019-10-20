//
//  Singleton.swift
//  
//
//  Created by Philippe Lafontaine on 2019-10-19.
//

public final class Singleton<T>: InjectorRegistrableInjectableProvider {
    public typealias Output = T
    
    private let initializer: () -> T
    
    private var value: T!
    
    public init(_ initializer: @escaping () -> T) {
        self.initializer = initializer
    }
    
    convenience public init(_ initializer: @autoclosure @escaping () -> T) {
      self.init(initializer)
    }
    
    public func register(_ injector: Injector) {
        injector.register(provider: self)
    }
    
    public func get() -> T {
        if value == nil {
            value = initializer()
        }
                  
        return value
    }
    
    
}
