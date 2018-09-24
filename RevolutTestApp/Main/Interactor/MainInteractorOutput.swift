//
//  MainMainInteractorOutput.swift
//  RevolutTestApp
//
//  Created by victorbogatyrev on 20/09/2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

import Foundation

protocol MainInteractorOutput: class {
  func viewModelPrepared(viewModel: MainViewModel)
  func setupOnlaunch(viewModel: MainViewModel)
}
