//
//  TestingButtons.swift
//  TestingControllerTests
//
//  Created by sandeepan swain on 03/11/22.
//

import XCTest
@testable import TestingController

class TestingButtons: XCTestCase {
    
    var sut: ViewController!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testIfLoginButtonHasActionAssigned() {
//        let loginButton: UIButton = sut.loginButton
//
//        guard let loginButtonActions = loginButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
//            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
//            return
//        }
//        XCTAssertTrue(loginButtonActions.contains("loginButtonTapped:"))
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
