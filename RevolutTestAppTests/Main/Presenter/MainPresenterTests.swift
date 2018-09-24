//
//  MainMainPresenterTests.swift
//  RevolutTestApp
//
//  Created by victorbogatyrev on 20/09/2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

import XCTest

class MainPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
  func testData() {
    
  }

  class MockInteractor: MainInteractorInput {
    func prepareData() {
      
    }
    
    func updateValue(value: Double) {
      
    }
    
    func updateBaseCurrency(model: CurrencyModel) {
      
    }
    

    }

    class MockRouter: MainRouterInput {

    }

  class MockViewController: MainViewInput {
    func setupInitialState(viewModel: MainViewModel) {
      
    }
    
    func updateViewModel(viewModel: MainViewModel) {
      
    }
    
    var viewModel: Any?
    
    }
}
