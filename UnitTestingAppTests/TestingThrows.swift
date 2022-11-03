//
//  TestingThrows.swift
//  TestingControllerTests
//
//  Created by sandeepan swain on 03/11/22.
//

import XCTest

enum SignupError: Error {
    case illigalCharactersFound
}

class SignupFormModelValidator  {
    private let invalidCharacters = CharacterSet(charactersIn: "{}$#%*&^.,/?!@")
    
    func isFirstNameValid(_ firstName: String) throws -> Bool {
        var returnValue = true
        
        // Check for illigal characters
        if ( firstName.rangeOfCharacter(from: invalidCharacters) != nil ) {
            throw SignupError.illigalCharactersFound
        }
        
        // Check first name
        if firstName.count < 2 || firstName.count > 10 {
            returnValue = false
        }
        
        return returnValue
    }
    
}

class TestingThrows: XCTestCase {

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
    
    //XCTAssertThrowsError
    func testFirstNameValidation_WhenInvalidCharactersProvided_ThrowsAnError() {
        // Arrange
        let sut = SignupFormModelValidator()
        
        // Act and Assert
        XCTAssertThrowsError(try sut.isFirstNameValid("Sergey*"), "The isFirstNameValid() should have thrown an error if user's first name contains illigal characters") { (errorThrown) in
            XCTAssertEqual(errorThrown as? SignupError, SignupError.illigalCharactersFound)
        }
    }
    
    //XCTAssertNoThrow
    
    func testFistNameValidation_WhenValidCharactersProvided_ThrowsNoErrors() {
        // Assert
        let sut = SignupFormModelValidator()

        // Act and Assert
        XCTAssertNoThrow(try sut.isFirstNameValid("Sergey"), "The isFirstNameValid() should not have thrown an error when there are no illigal characters provided")

    }

    // do try catch Instead of XCTAssertThrowsError
    func testFirstNameValidation_WhenInvalidCharactersProvided_ThrowsAnError_dotrycatch() {
        // Arrange
        let sut = SignupFormModelValidator()
        
       // Act and Assert
        do {
           let _ = try sut.isFirstNameValid("Sergey*")
           XCTFail("The isFirstNameValid() was supposed to throw an error when illigal characters used in User's first name")
        } catch SignupError.illigalCharactersFound {
            // Successfully passing
            return
        } catch {
             XCTFail("The isFirstNameValid() was supposed to throw the SignupError.illigalCharactersFound Error when illigal characters used. A different Error was thrown.")
            return
        }
    }
    
    // Do-Try-Catch Instead of XCTAssertNoThrow
    func testFistNameValidation_WhenValidCharactersProvided_ThrowsNoErrors_dotrycatch() {
        // Assert
        let sut = SignupFormModelValidator()
        
        // Act and Assert
        do {
        let _ = try sut.isFirstNameValid("Sergey")
        } catch {
            XCTFail("The isFirstNameValid() was not supposed to throw an Error when a valid First Name value was provided")
        }
    }
}
