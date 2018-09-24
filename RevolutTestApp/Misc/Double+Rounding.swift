//
//  Double+Rounding.swift
//  RevolutTestApp
//
//  Created by Victor Bogatyrev on 24.09.2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

import Foundation

extension Double {
  /// Rounds the double to decimal places value
  func rounded(toPlaces places:Int) -> Double {
    let divisor = pow(10.0, Double(places))
    return (self * divisor).rounded() / divisor
  }
}

