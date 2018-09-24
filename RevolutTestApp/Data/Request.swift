//
//  Request.swift
//  RevolutTestApp
//
//  Created by Victor Bogatyrev on 24.09.2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

import Foundation

class Request: NSObject {
  
  static private let baseURL = "https://revolut.duckdns.org/"
  
  static private let endPoint = "latest"
  
  
  class func getCurrencies(baseCurrency: String) {
    let url = baseURL + endPoint
    
    let parameters = ["base": baseCurrency] as [String : AnyObject]
    
    GET(url, parameters: parameters, headers: nil, completionHandler: {
      (data: Data?, response: URLResponse?, error: Error?) -> Void in
      
      processResponse(data, response: response, error: error, failEvent: Events.APIGETCurrenciesFailureEvent, successEvent: Events.APIGETCurrenciesSuccessEvent)
    })
  }
  
  private class func processResponse(_ data: Data?, response: URLResponse?, error: Error?, failEvent: Events, successEvent: Events) {
    
    if error != nil || response == nil {
      let userInfo = ["error": Error()]
      NotificationCenter.default.post(name: Notification.Name(rawValue: failEvent.rawValue), object: nil, userInfo: userInfo)
      return
    }
    
    if let httpResponse = response as? HTTPURLResponse {
      let statusCode = httpResponse.statusCode
      
      do {
        if let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject] {
          print(jsonResponse)
          
          if statusCode != 200 {
            let userInfo = ["error": Error(type: statusCode, status: jsonResponse["status"] as! Int, message: jsonResponse["error"] as! String, isRecoverable: jsonResponse["isRecoverable"] as! Bool)]
            NotificationCenter.default.post(name: Notification.Name(rawValue: failEvent.rawValue), object: nil, userInfo: userInfo)
            return
          }
          
          let userInfo = jsonResponse
          
          NotificationCenter.default.post(name: Notification.Name(rawValue: successEvent.rawValue), object: nil, userInfo: userInfo)
          
        } else {
          let userInfo = ["error": Error(type: statusCode)]
          NotificationCenter.default.post(name: Notification.Name(rawValue: failEvent.rawValue), object: nil, userInfo: userInfo)
          return
        }
      } catch {
        let userInfo = ["error": Error(type: ErrorType.parseError)]
        NotificationCenter.default.post(name: Notification.Name(rawValue: failEvent.rawValue), object: nil, userInfo: userInfo)
        return
      }
    } else {
      let userInfo = ["error": Error()]
      NotificationCenter.default.post(name: Notification.Name(rawValue: failEvent.rawValue), object: nil, userInfo: userInfo)
      return
    }
    
  }
  
  private class func GET(_ url: String,
                         parameters: [String: AnyObject]?,
                         headers: [String: AnyObject]?,
                         completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
    var completedURL = url
    
    if let params = parameters {
      completedURL += "?"
      for (key, value) in params {
        completedURL += "\(key)=\(value)&"
      }
      
      completedURL.removeLast(1)
    }
    
    httpGet(completedURL, headers: headers, completionHandler: completionHandler)
  }
  
  
  private class func httpGet(_ url: String, headers: [String: AnyObject]?, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
    let request = URLRequest(url: URL(string: url)!)
    let config = URLSessionConfiguration.default
    
    if headers != nil {
      config.httpAdditionalHeaders = headers
    }
    
    let session = URLSession(configuration: config)
    session.dataTask(with: request, completionHandler: {data, response, error in
      completionHandler(data, response, error as? Error)
    }).resume()
  }
}
