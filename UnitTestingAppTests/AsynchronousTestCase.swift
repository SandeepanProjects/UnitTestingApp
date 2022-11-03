
import XCTest

final class AsynchronousTestCase: XCTestCase {
  func test_noServerResponse() {
    let expectation = expectation(description: "Server responds in reasonable time")
    defer { waitForExpectations(timeout: 2) }

    let url = URL(string: "doggone")!
    URLSession.shared.dataTask(with: url) { data, response, error in
      defer { expectation.fulfill() }

      XCTAssertNil(data)
      XCTAssertNil(response)
      XCTAssertNotNil(error)
    }
    .resume()
  }
}
