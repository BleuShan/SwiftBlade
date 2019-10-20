//
//  SingletonTests.swift
//  
//
//  Created by Philippe Lafontaine on 2019-10-20.
//

import Quick
import Nimble

@testable import class SwiftBlade.Singleton
import class SwiftBlade.Injector

typealias S = Singleton<MockClass>

class SingletonSpec: QuickSpec {
    override func spec() {
        describe("An injector") {
            describe("with a Singleton<MockClass>") {
                itBehavesLike(AnInjectorWithARegistrable.self) {
                    S(MockClass())
                }
            }
        }
        
        describe("A Singleton<MockClass> instance") {
            itBehavesLike(AnInjectorRegistrableInjectableProvider<S>.self) {
                let ctx = InjectorRegistrableInjectableProviderBehaviorContext<S>()
                
                ctx.provider = Singleton {
                    ctx.initialized.toggle()
                    return MockClass()
                }
                
                return ctx
            }
        }
    }
}
