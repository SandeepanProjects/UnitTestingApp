//
//  KittenDataSourceTests.swift
//  KittenDataSourceTests
//
//  Created by Afnan Khan on 9/28/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import XCTest

@testable import UnitTestTutorial

class KittenDataSource : NSObject, UITableViewDataSource   {
    
    var kittens = [Kitten]()

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kittens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = kittens[indexPath.row].name
         
        cell.accessoryType = ( kittens[indexPath.row].isAdoptable) ? .disclosureIndicator : .none
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return kittens.count > 0 ? 1 : 0
    }
    
}

class KittenDataSourceTests: XCTestCase {
    var dataSource: KittenDataSource!
    let tableView = UITableView()

    

    override func setUp() {
        super.setUp()
        
        dataSource = KittenDataSource()
        
         // For table view it is important
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.estimatedRowHeight = 44

        
        
        for number in 0..<20 {
            let kitten = Kitten(name: "Kitten: \(number)")
            dataSource.kittens.append(kitten)
        }
        
    }
    
    func test001_DataSourceHasKittens() {
        XCTAssertEqual(dataSource.kittens.count, 20,
                       "DataSource should have correct number of kittens")
    }

    
    func test002_NumberOfRows() {
        let tableView = UITableView()
        
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 20,
                       "Number of rows in table should match number of kittens")
    }
    
    func test003_CellForRow() {
        
         let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(cell.textLabel?.text, "Kitten: 0",
                       "The first cell should display name of first kitten")
    }
    
    func test004_HasZeroSectionsWhenZeroKittens() {
        dataSource.kittens = []
        
 
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 0,
                       "TableView should have zero sections when no kittens are present")
    }
    
    func test005_HasOneSectionWhenKittensArePresent() {
 
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1,
                       "TableView should have one section when kittens are present")
    }
    
    
     
    
    
    
}
