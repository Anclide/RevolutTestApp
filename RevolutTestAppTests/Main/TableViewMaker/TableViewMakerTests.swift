//
//  TableViewMakerTests.swift
//  RevolutTestAppTests
//
//  Created by Victor Bogatyrev on 24.09.2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

import XCTest

class TableViewMakerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialState() {
      
      let viewController = MainViewController()
      let configurator = MainModuleConfigurator()
      
      configurator.configureModuleForViewInput(viewInput: viewController)
      
      XCTAssertNotNil(viewController.tableViewMaker.collectionViewOwner.viewModel, "viewModel is nil after")
    }
  
    class TableViewMakerMock: TableViewMaker {
    
    }


}
