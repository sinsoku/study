import XCTest
@testable import PlayGround

class PlayGroundTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(PlayGround().text, "Hello, World!")
    }


    static var allTests : [(String, (PlayGroundTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
