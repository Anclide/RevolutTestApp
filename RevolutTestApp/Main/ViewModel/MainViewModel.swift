//
//  MainViewModel.swift
//  RevolutTestApp
//
//  Created by Victor Bogatyrev on 24.09.2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

import Foundation

struct MainViewModel {
  var currencies: [CurrencyModel]
  
  func indexPaths() -> [IndexPath] {
    var indexPaths = [IndexPath]()
    for i in 1..<currencies.count {
      indexPaths.append(IndexPath(row: i, section: 0))
    }
    
    return indexPaths
  }
}
