import Quick
import Nimble
@testable import class SwiftBlade.Injector

class InjectorSpec: QuickSpec {
    override func spec() {
        describe("An Injector") {
            describe("with a MockInjectorRegistrable") {
                itBehavesLike(AnInjectorWithARegistrable.self) {
                    MockInjectorRegistrable()
                }
            }
        }
    }
}
