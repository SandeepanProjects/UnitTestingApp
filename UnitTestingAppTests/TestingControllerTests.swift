//
//  TestingControllerTests.swift
//  TestingControllerTests
//
//  Created by sandeepan swain on 03/11/22.
//

import XCTest
@testable import TestingController

class TestingControllerTests: XCTestCase {
    var sut: ViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // Step 2. Instantiate UIViewController with Storyboard ID
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        
        // Step 3. Make the viewDidLoad() execute.
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
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


//Loading UIViewController with XIB

//class LoadingViewControllerFromXIB: XCTestCase {
//    var sut: LoginViewController!
//
//    override func setUpWithError() throws {
//        sut = LoginViewController()
//        sut.loadViewIfNeeded()
//    }
//
//    override func tearDownWithError() throws {
//        sut = nil
//    }
//
//   // TEST METHODS GO BELOW
//
//}

//UIViewController with No Storyboard or XIB File

//class MainPageViewController: UIViewController {
//
//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        print("Main page view controller has loaded")
//    }
//
//}

//class LoadingHomePageViewController: XCTestCase {
//    var sut: MainPageViewController!
//
//    override func setUpWithError() throws {
//
//        sut = MainPageViewController()
//        sut.loadViewIfNeeded()
//    }
//    override func tearDownWithError() throws {
//        sut = nil
//    }
//    // TEST METHODS BELOW
//}


//Call the loadViewIfNeeded() method to make the viewDidLoad() execute.


                    // Test button action for login



//@IBAction func nextViewButtonTapped(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
//
//        self.navigationController?.pushViewController(secondViewController, animated: true)
//    }




//class TestNavigationTutorialTests: XCTestCase {
//
//    var sut: ViewController!
//    var navigationController: UINavigationController!
//
//    override func setUpWithError() throws {
//        // Step 1. Create an instance of UIStoryboard
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        // Step 2. Instantiate UIViewController with Storyboard ID
//        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
//
//        // Step 3. Make the viewDidLoad() execute.
//        sut.loadViewIfNeeded()
//        navigationController = UINavigationController(rootViewController: sut)
//    }
//
//    override func tearDownWithError() throws {
//        sut = nil
//        navigationController = nil
//    }
//
//}


//Test Navigation with Predicate and Expectation for push navigation


//func testNextViewButton_WhenTapped_SecondViewControllerIsPushed() throws {
//
//    // Create a Predicate to evaluate if the TopViewController is a SecondViewController
//    let myPredicate = NSPredicate { input, _ in
//        return (input as? UINavigationController)?.topViewController is SecondViewController
//    }
//
//    // Create Expectation for a Predicate.
//    // This will make our unit test method, continously evalulate the
//    // predicate until it matches or expectation times out.
//    self.expectation(for: myPredicate, evaluatedWith: navigationController)
//
//    // Act
//    sut.nextViewButton.sendActions(for: .touchUpInside)
//
//    waitForExpectations(timeout: 2)
//}


//func testNextViewButton_WhenTapped_SecondViewControllerIsPushed2() throws {
//
//    // Act
//    sut.nextViewButton.sendActions(for: .touchUpInside)
//    RunLoop.current.run(until: Date())
//
//    // Assert
//    guard let _ = navigationController.topViewController as? SecondViewController else {
//        XCTFail()
//        return
//    }
//
//}



// Test Navigation. An approach with a Spy object

//class SpyNavigationController: UINavigationController {
//
//    var pushedViewController: UIViewController?
//
//    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//        pushedViewController = viewController
//        super.pushViewController(viewController, animated: true)
//    }
//}


//func testNextViewButton_WhenTapped_SecondViewControllerIsPushed3() throws {
//    // Wrap ViewController into a Spy version of Navigation Controller
//    let mockNavigationController = SpyNavigationController(rootViewController: sut)
//    // Act
//    sut.nextViewButton.sendActions(for: .touchUpInside)
//
//    // Assert
//    guard let _ = mockNavigationController.pushedViewController as? SecondViewController else {
//        XCTFail()
//        return
//    }
//
//}
