//
//  MainMainInteractor.swift
//  RevolutTestApp
//
//  Created by victorbogatyrev on 20/09/2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//
import Foundation

class MainInteractor: MainInteractorInput {

    weak var output: MainInteractorOutput!
  
  var baseCurrency = "EUR"
  
  var isInitial = true
  
  var timer: Timer?
  
  init() {
    NotificationCenter.default.addObserver(self, selector: #selector(onRequestSuccessEvent(notification:)), name: Notification.Name(rawValue: Events.APIGETCurrenciesSuccessEvent.rawValue), object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(onRequestFailureEvent(notification:)), name: Notification.Name(rawValue: Events.APIGETCurrenciesFailureEvent.rawValue), object: nil)
    
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(getData), userInfo: nil, repeats: true)
  }
  
  deinit {
    timer?.invalidate()
    NotificationCenter.default.removeObserver(self)
  }
  
  
  @objc func onRequestSuccessEvent(notification: Notification) {
    guard let data = notification.userInfo else { return }
    guard let rates = data["rates"] as? [String : Double] else { return }
    var currencies = [CurrencyModel]()
    currencies.append(CurrencyModel(name: baseCurrency, multiplier: 1.0))
    for (key, value) in rates {
      currencies.append(CurrencyModel(name: key, multiplier: value))
    }
    let viewModel = MainViewModel(currencies: currencies)
    
    if isInitial {
      output.setupOnlaunch(viewModel: viewModel)
      isInitial = false
    } else {
      output.viewModelPrepared(viewModel: viewModel)
    }
  }
  
  @objc func onRequestFailureEvent(notification: Notification) {
    
  }
  
  func prepareData() {
    timer?.fire()
  }
  
  @objc func getData() {
    Request.getCurrencies(baseCurrency: baseCurrency)
  }
 
}
