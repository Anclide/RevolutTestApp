//
//  MainMainViewTests.swift
//  RevolutTestApp
//
//  Created by victorbogatyrev on 20/09/2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

import XCTest

class MainViewTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
  func testBindingCollections() {
    let viewController = MainViewControllerMock()
    let configurator = MainModuleConfigurator()
    
    configurator.configureModuleForViewInput(viewInput: viewController)

    
    XCTAssertNotNil(viewController.tableView.delegate, "tableViewDelegate is nil after binding")
  }
  
  
  class MainViewControllerMock: MainViewController {
    
    var setupInitialStateDidCall = false
    
    override func setupInitialState(viewModel: MainViewModel) {
      setupInitialStateDidCall = true
    }
    
  }

}
