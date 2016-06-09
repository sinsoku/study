import XCTest
@testable import app

class appTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(app().text, "Hello, World!")
    }


    static var allTests : [(String, (appTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
