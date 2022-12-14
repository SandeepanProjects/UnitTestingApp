//
//  LoginTestCases.swift
//  TestingControllerTests
//
//  Created by sandeepan swain on 03/11/22.
//

import XCTest

class MockLoginService: LoginService {
  var result: Result<User, LoginError>?

  func login(_ completion: @escaping (Result<User, LoginError>) -> Void) {
    if let result = result {
      completion(result)
    }
  }
}

class LoginTestCases: XCTestCase {

    var loginFormViewModel: LoginFormViewModel!
    var loginService: MockLoginService!

    override func setUp() {
      loginService = MockLoginService()
      loginFormViewModel = LoginFormViewModel(loginService: loginService)
    }

    func testEmptyLoginFormThrowsError() {
      XCTAssertNil(loginFormViewModel.username)
      XCTAssertNil(loginFormViewModel.password)

      let testExpectation = expectation(description: "Expected login completion handler to be called")

      loginFormViewModel.login { result in
        guard case let .failure(error) = result, case error = LoginError.formIsEmpty else {
          XCTFail("Expected completion to be called with formIsEmpty")
          testExpectation.fulfill()
          return
        }

        testExpectation.fulfill()
      }

      waitForExpectations(timeout: 1, handler: nil)
    }

    func testEmptyUsernameThrowsError() {
      loginFormViewModel.password = "password"
      XCTAssertNil(loginFormViewModel.username)
      XCTAssertNotNil(loginFormViewModel.password)

      let testExpectation = expectation(description: "Expected login completion handler to be called")

      loginFormViewModel.login { result in
        guard case let .failure(error) = result, case error = LoginError.usernameIsEmpty else {
          XCTFail("Expected completion to be called with usernameIsEmpty")
          testExpectation.fulfill()
          return
        }

        testExpectation.fulfill()
      }

      waitForExpectations(timeout: 1, handler: nil)
    }

    func testEmptyPasswordThrowsError() {
      loginFormViewModel.username = "username"
      XCTAssertNil(loginFormViewModel.password)
      XCTAssertNotNil(loginFormViewModel.username)

      let testExpectation = expectation(description: "Expected login completion handler to be called")

      loginFormViewModel.login { result in
        guard case let .failure(error) = result, case error = LoginError.passwordIsEmpty else {
          XCTFail("Expected completion to be called with passwordIsEmpty")
          testExpectation.fulfill()
          return
        }

        testExpectation.fulfill()
      }

      waitForExpectations(timeout: 1, handler: nil)
    }

    func testInvalidEmailThrowsError() {
      loginFormViewModel.username = "username"
      loginFormViewModel.password = "password"
      XCTAssertNotNil(loginFormViewModel.username)
      XCTAssertNotNil(loginFormViewModel.password)

      let testExpectation = expectation(description: "Expected login completion handler to be called")

      loginFormViewModel.login { result in
        guard case let .failure(error) = result, case error = LoginError.emailIsInvalid else {
          XCTFail("Expected completion to be called with emailIsInvalid")
          testExpectation.fulfill()
          return
        }

        testExpectation.fulfill()
      }

      waitForExpectations(timeout: 1, handler: nil)
    }

    func testServerRespondsWithUnkownCredentials() {
      loginFormViewModel.username = "valid@mail.com"
      loginFormViewModel.password = "password"
      XCTAssertNotNil(loginFormViewModel.username)
      XCTAssertNotNil(loginFormViewModel.password)

      loginService.result = .failure(LoginError.incorrectCredentials)

      let testExpectation = expectation(description: "Expected login completion handler to be called")

      loginFormViewModel.login { result in
        guard case let .failure(error) = result, case error = LoginError.incorrectCredentials else {
          XCTFail("Expected completion to be called with incorrectCredentials")
          testExpectation.fulfill()
          return
        }

        testExpectation.fulfill()
      }

      waitForExpectations(timeout: 1, handler: nil)
    }

    func testServerSuccessReturnsUser() {
      loginFormViewModel.username = "valid@mail.com"
      loginFormViewModel.password = "password"
      XCTAssertNotNil(loginFormViewModel.username)
      XCTAssertNotNil(loginFormViewModel.password)

      loginService.result = .success(User())

      let testExpectation = expectation(description: "Expected login completion handler to be called")

      loginFormViewModel.login { result in
        guard case let .success(user) = result else {
          XCTFail("Expected completion to be called with a user")
          testExpectation.fulfill()
          return
        }

        testExpectation.fulfill()
      }

      waitForExpectations(timeout: 1, handler: nil)
    }
    
//    func test_login_without_username() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateInitialViewController() as! LoginViewController
//        let _ = vc.view
//
//        vc.username!.text = ""
//
//        vc.loginButtonTapped()
//
//        XCTAssertFalse(vc.errorLabel!.isHidden)
//        XCTAssertEqual("Please enter a username or email", vc.errorLabel!.text!)
//    }

}


