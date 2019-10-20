//
//  Injector.swift
//
//  Created by Philippe Lafontaine on 2019-10-19.
//


public final class Injector {
    private var registry = Dictionary<AnyHashable, Any>()
    
    public init(_ builder: @escaping () -> InjectorRegistrable) {
        builder().register(self)
    }
    
    public func register<K>(_ value: Any, as key: K) where K : Hashable {
        registry[key] = value
    }
    
    public func register<P>(provider: P) where P : InjectorRegistrableInjectableProvider {
        register(provider.asAnyInjectableProvider())
    }
    
    public func register(_ item: TypeIdentifiable) {
        register(item, as: item.typeId)
    }
    
    public func register(_ item: InjectorRegistrable) {
        register(item, as: TypeIdentifier(item))
    }
    
    public func resolve<K, V>(using key: K) -> V? where K : Hashable {
        if let stored = registry[key] {
            if let value = stored as? V {
                return value
            }
            
            if let provider = stored as? AnyInjectableProvider<V>  {
                return provider.get()
            }
        }
        
        return nil
    }
    
    public func resolve<V>(_ ty: V.Type) -> V? {
        resolve(using: TypeIdentifier(ty))
    }
}
