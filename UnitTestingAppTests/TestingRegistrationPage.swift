//
//  TestingRegistrationPage.swift
//  TestingControllerTests
//
//  Created by sandeepan swain on 03/11/22.
//

import XCTest

struct UserRegistrationModel {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let repeatPassword: String
}
extension UserRegistrationModel {
    func isValidFirstName() -> Bool {
        return firstName.count > 1
    }
    
    func isValidLastName() -> Bool {
        return lastName.count > 1
    }
    func isValidEmail() -> Bool {
        return email.contains("@") && email.contains(".")
    }
    func isValidPasswordLength() -> Bool {
        return password.count >= 8 && password.count <= 16
    }
    
    func doPasswordsMatch() -> Bool {
        return password == repeatPassword
    }
    
    func isValidPassword() -> Bool {
        return isValidPasswordLength() && doPasswordsMatch()
    }
    
    func isDataValid() -> Bool {
        return isValidFirstName() && isValidLastName() && isValidEmail() && isValidPasswordLength() &&
        doPasswordsMatch()
    }
}

class TestingRegistrationPage: XCTestCase {

    var sut: UserRegistrationModel!
      let firstName = "Sergey"
      let lastName = "Kargopolov"
      let email = "test@test.com"
      let password = "12345678"
      let repeatPassword = "12345678"
      
      override func setUp() {
      }
      override func tearDown() {
          // Put teardown code here. This method is called after the invocation of each test method in the class.
          sut = nil
      }
      
      func testUserModelStruc_canCreateNewInstance() {
          sut = UserRegistrationModel(firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          repeatPassword: repeatPassword)
          
          XCTAssertNotNil(sut)
       }
   
      func testUserFirstName_shouldPassIfValidFirstName() {
          sut = UserRegistrationModel(firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          repeatPassword: repeatPassword)
          
          XCTAssertTrue(sut.isValidFirstName())
       }
      
      func testUserFirstName_shouldPassIfFirstNameLessThanMinLength() {
          sut = UserRegistrationModel(firstName: "S",
          lastName: lastName,
          email: email,
          password: password,
          repeatPassword: repeatPassword)
          
          XCTAssertFalse(sut.isValidFirstName())
      }
      
      func testUserLastName_shouldPassIfValidLastName() {
          sut = UserRegistrationModel(firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          repeatPassword: repeatPassword)
          
          XCTAssertTrue(sut.isValidLastName())
      }
      
      func testUserLastName_shouldPassIfLastNameLessThanMinLength() {
          sut = UserRegistrationModel(firstName: firstName,
          lastName: "K",
          email: email,
          password: password,
          repeatPassword: repeatPassword)
          
          XCTAssertFalse(sut.isValidLastName())
      }
      
      func testUserRegistrationModel_shouldPassIfValidEmail() {
          sut = UserRegistrationModel(firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          repeatPassword: repeatPassword)
          
          XCTAssertTrue(sut.isValidEmail())
      }
      
      func testUserRegistrationModel_shouldPassIfInValidEmail() {
          
          sut = UserRegistrationModel(firstName: firstName,
          lastName: lastName,
          email: "test.com",
          password: password,
          repeatPassword: repeatPassword)
          
          XCTAssertFalse(sut.isValidEmail())
      }
      
      func testUserRegistrationModel_shouldPassIfValidPasswordLength() {
          sut = UserRegistrationModel(firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          repeatPassword: repeatPassword)
          
          XCTAssertTrue(sut.isValidPasswordLength())
      }
      
      func testUserPassword_passwordAndRepeatPasswordMustMatch() {
          sut = UserRegistrationModel(firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          repeatPassword: repeatPassword)
          
          XCTAssertTrue(sut.doPasswordsMatch())
      }
      
      func testUserPassword_shouldPassIfPasswordIsValid() {
          sut = UserRegistrationModel(firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          repeatPassword: repeatPassword)
          
          XCTAssertTrue(sut.isValidPassword())
      }


}
