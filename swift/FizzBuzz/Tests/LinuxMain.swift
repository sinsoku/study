import XCTest
@testable import appTestSuite

XCTMain([
     testCase(appTests.allTests),
     testCase(FizzBuzzTests.allTests),
])
