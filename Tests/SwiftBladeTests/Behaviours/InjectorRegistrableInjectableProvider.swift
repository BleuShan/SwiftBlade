//
//  InjectorRegistrableInjectableProvider.swift
//  
//
//  Created by Philippe Lafontaine on 2019-10-20.
//

import Quick
import Nimble
import protocol SwiftBlade.InjectorRegistrableInjectableProvider


class InjectorRegistrableInjectableProviderBehaviorContext<P> where P : InjectorRegistrableInjectableProvider {
    var initialized = false
    var provider: P!
}


class AnInjectorRegistrableInjectableProvider<P> : Behavior<InjectorRegistrableInjectableProviderBehaviorContext<P>>
    where P : InjectorRegistrableInjectableProvider,
          P.Output : AnyObject{
    
    typealias Context = InjectorRegistrableInjectableProviderBehaviorContext<P>
    
    override class var name: String {
           get {
               "behave like an InjectableProvider because it"
           }
    }
    
    override class func spec(_ context: @escaping () -> Context) {
        var ctx: Context!
        beforeEach {
            ctx = context()
            guard ctx.provider != nil else {
                fatalError()
            }
        }
        
        it("the get method calls the initializer") {
            expect(ctx.initialized).to(beFalse())
            let result = ctx.provider.get()
            expect(result).notTo(beNil())
            expect(ctx.initialized).notTo(beFalse())
        }
        
        it("is AnyInjectableProviderConvertible") {
            let provider = ctx.provider.asAnyInjectableProvider()
            expect(ctx.initialized).to(beFalse())
            let result = provider.get()
            expect(result).notTo(beNil())
            expect(ctx.initialized).notTo(beFalse())
            
            let original = ctx.provider.get()
            
            expect(ObjectIdentifier(original)).to(equal(ObjectIdentifier(result)))
        }
    }
}
