//
//  Error.swift
//  RevolutTestApp
//
//  Created by Victor Bogatyrev on 24.09.2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

import Foundation

enum ErrorType: UInt {
  case unknownError = 10
  case timeOutError = 11
  case noConnectionError = 12
  case authFailError = 13
  case serverError = 14
  case networkError = 15
  case parseError = 16
  case badRequestError = 400
  case goneError = 410
}

class Error {
  var type: ErrorType = .unknownError
  var message = "Произошла ошибка, попробуйте повторить запрос позже"
  var isRecoverable = false
  
  init() {}
  
  init(type: Int) {
    self.type = parseType(type)
  }
  
  init(type: ErrorType) {
    self.type = type
  }
  
  init(type: Int, status: Int) {
    self.type = parseType(type)
  }
  
  /*
   init (type: Int, status: Int, message: String) {
   self.type = parseType(type)
   self.status = parseStatus(status)
   self.message = message
   self.isRecoverable = 0
   }
   */
  
  init(type: Int, status: Int, message: String, isRecoverable: Bool) {
    self.type = parseType(type)
    self.message = message
    self.isRecoverable = isRecoverable
  }
  
  func parseType(_ type: Int) -> ErrorType {
    switch type {
    case 400:
      return .badRequestError
    case 403:
      return .authFailError
    case 410:
      return .goneError
    default:
      return .unknownError
    }
  }
  
}
