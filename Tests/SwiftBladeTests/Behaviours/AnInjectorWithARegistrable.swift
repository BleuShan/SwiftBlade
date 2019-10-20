//
//  AnInjectorWithARegistrable.swift
//  
//
//  Created by Philippe Lafontaine on 2019-10-20.
//

import Quick
import Nimble
@testable import class SwiftBlade.Injector
import protocol SwiftBlade.InjectorRegistrable
import struct SwiftBlade.TypeIdentifier

class AnInjectorWithARegistrable : Behavior<InjectorRegistrable> {
    override class var name: String {
        get {
            "behave like an Injector with a registrable because it"
        }
    }
    
    override class func spec(_ context: @escaping () -> InjectorRegistrable) {
        var injector: Injector!
        var registrable: InjectorRegistrable!
        
        beforeEach {
            registrable = context()
            injector = Injector {
                registrable
            }
        }
        
        it("was instantiated") {
            expect(injector).notTo(beNil())
        }
        
        it("resolves what was registered") {
            let resolved: Any? = injector?.resolve(using: TypeIdentifier(registrable!))
            expect(resolved).notTo(beNil())
        }
        
    }
}
