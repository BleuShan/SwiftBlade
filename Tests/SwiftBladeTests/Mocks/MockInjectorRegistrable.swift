//
//  MockInjectorRegistrable.swift
//  
//
//  Created by Philippe Lafontaine on 2019-10-20.
//

import protocol SwiftBlade.InjectorRegistrable
import class SwiftBlade.Injector

class MockInjectorRegistrable : MockClass, InjectorRegistrable {
    func register(_ injector: Injector) {
        injector.register(self)
    }

}

