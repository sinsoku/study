import XCTest
@testable import PlayGroundTestSuite

XCTMain([
     testCase(PlayGroundTests.allTests),
     testCase(SimpleClassTests.allTests),
])
