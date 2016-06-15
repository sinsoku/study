import XCTest
@testable import PlayGround

class SimpleClassTests: XCTestCase {
    func testSimpleClassBehavior() {
        let obj = SimpleClass()
        // refs: https://stackoverflow.com/questions/25725033/swift-too-smart-checking-an-objects-type-when-testing-with-xctest
        XCTAssertTrue((obj as Any) is SimpleClass)
        XCTAssertTrue((obj as Any) is BaseClass)
    }

    // refs: https://github.com/apple/swift/blob/swift-DEVELOPMENT-SNAPSHOT-2016-06-06-a/stdlib/public/core/Mirror.swift#L137
    func testReflectionBehavior() {
        let playGround = Mirror(reflecting: PlayGround())
        XCTAssertEqual(playGround.description, "Mirror for PlayGround")
        XCTAssertEqual(playGround.displayStyle, Mirror.DisplayStyle.struct)
        XCTAssertTrue(playGround.subjectType == PlayGround.self)

        let base = Mirror(reflecting: BaseClass())
        XCTAssertEqual(base.description, "Mirror for BaseClass")
        XCTAssertEqual(base.displayStyle, Mirror.DisplayStyle.class)
        XCTAssertTrue(base.subjectType == BaseClass.self)

        let simple = Mirror(reflecting: SimpleClass())
        XCTAssertEqual(simple.description, "Mirror for SimpleClass")
        XCTAssertEqual(simple.displayStyle, Mirror.DisplayStyle.class)
        XCTAssertTrue(simple.subjectType == SimpleClass.self)

        let parent = simple.superclassMirror
        XCTAssertEqual(parent?.description, "Mirror for BaseClass")
        XCTAssertEqual(parent?.displayStyle, Mirror.DisplayStyle.class)
        XCTAssertTrue(parent?.subjectType == BaseClass.self)

        let defNumber = base.children.filter { $0.label == "number" }[0]
        XCTAssertEqual((defNumber.value as! Int), 0)
        let defString = base.children.filter { $0.label == "string" }[0]
        // FIXME: the assertion is failed. (XCTAssertNil failed: "nil")
        // XCTAssertNil(defString.value)
        XCTAssertEqual(String(defString.value), "nil")
    }

    static var allTests : [(String, (SimpleClassTests) -> () throws -> Void)] {
        return [
            ("testSimpleClassBehavior", testSimpleClassBehavior),
            ("testReflectionBehavior", testReflectionBehavior),
        ]
    }
}
