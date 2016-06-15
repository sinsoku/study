import XCTest
@testable import PlayGround

class SimpleClassTests: XCTestCase {
    func testSimpleClassBehavior() {
        let obj = SimpleClass()
        // refs: https://stackoverflow.com/questions/25725033/swift-too-smart-checking-an-objects-type-when-testing-with-xctest
        XCTAssertTrue((obj as Any) is SimpleClass)
        XCTAssertTrue((obj as Any) is BaseClass)
    }

    static var allTests : [(String, (SimpleClassTests) -> () throws -> Void)] {
        return [
            ("testSimpleClassBehavior", testSimpleClassBehavior),
        ]
    }
}
