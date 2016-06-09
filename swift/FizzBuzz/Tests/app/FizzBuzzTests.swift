import XCTest
@testable import app

class FizzBuzzTests: XCTestCase {
    func testThree() {
      let fizzBuzz = FizzBuzz(num: 3)
      XCTAssertEqual(fizzBuzz.toString(), "Fizz")
    }

    func testFive() {
      let fizzBuzz = FizzBuzz(num: 5)
      XCTAssertEqual(fizzBuzz.toString(), "Buzz")
    }

    func testFifteen() {
      let fizzBuzz = FizzBuzz(num: 15)
      XCTAssertEqual(fizzBuzz.toString(), "FizzBuzz")
    }

    func testOther() {
      let fizzBuzz = FizzBuzz(num: 1)
      XCTAssertEqual(fizzBuzz.toString(), "1")
    }

    static var allTests : [(String, (FizzBuzzTests) -> () throws -> Void)] {
        return [
            ("testThree", testThree),
            ("testFive", testFive),
            ("testFifteen", testFifteen),
            ("testOther", testOther)
        ]
    }
}
