//
//  AnyInjectableProviderConvertible.swift
//  
//
//  Created by Philippe Lafontaine on 2019-10-20.
//

public protocol AnyInjectableProviderConvertible : InjectableProvider {
    func asAnyInjectableProvider() -> AnyInjectableProvider<Output>
}

extension AnyInjectableProviderConvertible {
    public func asAnyInjectableProvider() -> AnyInjectableProvider<Output> {
        AnyInjectableProvider(self)
    }
}
