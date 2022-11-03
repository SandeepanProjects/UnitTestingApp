//
//  TestTextfield.swift
//  TestingControllerTests
//
//  Created by sandeepan swain on 03/11/22.
//

import XCTest

class TestTextfield: XCTestCase {

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


//class TestingUITextFieldPropertiesTests: XCTestCase {
//    var sut: SignupViewController!
//
//    override func setUpWithError() throws {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
//
//        sut.loadViewIfNeeded()
//    }
//
//    override func tearDownWithError() throws {
//        sut = nil
//    }
//}


//Test that UITextField is Connected

//func testSignupForm_WhenLoaded_TextFieldAreConnected() throws {
// _ = try XCTUnwrap(sut.firstNameTextField, "The First Name UITextField is not connected")
// _ = try XCTUnwrap(sut.lastNameTextField, "The Last Name UITextField is not connected")
// _ = try XCTUnwrap(sut.emailTextField, "Email address UITextField is not connected")
// _ = try XCTUnwrap(sut.mobilePhoneTextField, "Mobile phone UITextField is not connected")
// _ = try XCTUnwrap(sut.passwordTextField, "The Password UITextField is not connected")
//}


//Test UITextField has Correct Input Text Content Type

//func testEmailTextField_WhenCreated_HasEmailAddressContentTypeSet() throws {
//    let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address UITextField is not connected")
//
//    XCTAssertEqual(emailTextField.textContentType, UITextContentType.emailAddress, "Email address UITextField does not have an Email Address Content Type set")
//}


//Test UITextField has Correct Input Text Content Type

//func testEmailTextField_WhenCreated_HasEmailAddressContentTypeSet() throws {
//    let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address UITextField is not connected")
//
//    XCTAssertEqual(emailTextField.textContentType, UITextContentType.emailAddress, "Email address UITextField does not have an Email Address Content Type set")
//}


// Test that UITextField Has Correct Keyboard Type

//func testEmailTextField_WhenCreated_HasEmailKeyboardTypeSet() throws {
//   let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address UITextField is not connected")
//
//    XCTAssertEqual(emailTextField.keyboardType, UIKeyboardType.emailAddress, "Email Address UITextField does not have Email Keyboard type set")
//}


//Test that Password Text Field is a Secure Text Entry

//func testPasswordTextField_WhenCreated_IsSecureTextEntryField() throws {
//    let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The Password UITextField is not connected")
//
//    XCTAssertTrue(passwordTextField.isSecureTextEntry, "Password UITextField is not a Secure Text Entry Fieldg")
//}
