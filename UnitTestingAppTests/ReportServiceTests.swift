

import XCTest
@testable import PandemicReport
import CoreData

class ReportServiceTests: XCTestCase {
  // MARK: - Properties
  // swiftlint:disable implicitly_unwrapped_optional
  var reportService: ReportService!
  var coreDataStack: CoreDataStack!
  // swiftlint:enable implicitly_unwrapped_optional

  override func setUp() {
    super.setUp()
    coreDataStack = TestCoreDataStack()
    reportService = ReportService(managedObjectContext: coreDataStack.mainContext, coreDataStack: coreDataStack)
  }

  override func tearDown() {
    super.tearDown()
    reportService = nil
    coreDataStack = nil
  }

  func testAddReport() {
    let report = reportService.add("Death Star", numberTested: 1000, numberPositive: 999, numberNegative: 1)

    XCTAssertNotNil(report, "Report should not be nil")
    XCTAssertTrue(report.location == "Death Star")
    XCTAssertTrue(report.numberTested == 1000)
    XCTAssertTrue(report.numberPositive == 999)
    XCTAssertTrue(report.numberNegative == 1)
    XCTAssertNotNil(report.id, "id should not be nil")
    XCTAssertNotNil(report.dateReported, "dateReported should not be nil")
  }

  func testRootContextIsSavedAfterAddingReport() {
    let derivedContext = coreDataStack.newDerivedContext()
    reportService = ReportService(managedObjectContext: derivedContext, coreDataStack: coreDataStack)

    expectation(
      forNotification: .NSManagedObjectContextDidSave,
      object: coreDataStack.mainContext) { _ in
        return true
    }

    derivedContext.perform {
      let report = self.reportService.add("Death Star 2", numberTested: 600, numberPositive: 599, numberNegative: 1)

      XCTAssertNotNil(report)
    }

    waitForExpectations(timeout: 2.0) { error in
      XCTAssertNil(error, "Save did not occur")
    }
  }

  func testGetReports() {
    let newReport = reportService.add("Endor", numberTested: 30, numberPositive: 20, numberNegative: 10)

    let getReports = reportService.getReports()

    XCTAssertNotNil(getReports)
    XCTAssertTrue(getReports?.count == 1)
    XCTAssertTrue(newReport.id == getReports?.first?.id)
  }

  func testUpdateReport() {
    let newReport = reportService.add("Snow Planet", numberTested: 0, numberPositive: 0, numberNegative: 0)
    newReport.numberTested = 30
    newReport.numberPositive = 10
    newReport.numberNegative = 20
    newReport.location = "Hoth"
    let updatedReport = reportService.update(newReport)

    XCTAssertTrue(newReport.id == updatedReport.id)
    XCTAssertTrue(updatedReport.numberTested == 30)
    XCTAssertTrue(updatedReport.numberPositive == 10)
    XCTAssertTrue(updatedReport.numberNegative == 20)
    XCTAssertTrue(updatedReport.location == "Hoth")
  }

  func testDeleteReport() {
    let newReport = reportService.add("Starkiller Base", numberTested: 100, numberPositive: 80, numberNegative: 20)

    var fetchReports = reportService.getReports()
    XCTAssertTrue(fetchReports?.count == 1)
    XCTAssertTrue(newReport.id == fetchReports?.first?.id)

    reportService.delete(newReport)

    fetchReports = reportService.getReports()

    XCTAssertTrue(fetchReports?.isEmpty ?? false)
  }
}
