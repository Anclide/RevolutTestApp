//
//  TableViewMaker.swift
//  RevolutTestApp
//
//  Created by Victor Bogatyrev on 24.09.2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

import UIKit

class TableViewMaker: NSObject, UITableViewDataSource, UITableViewDelegate {
  
  var collectionViewOwner: CollectionViewOwner!
  
  var onSelected: ((_ model: CurrencyModel)->())?
  var onValueChanged: ((_ value: Double)->())?
  
  var viewModel: MainViewModel? {
    return collectionViewOwner.viewModel as? MainViewModel
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let inputViewModel = viewModel else { return 0 }
    return inputViewModel.currencies.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let inputViewModel = viewModel else { return UITableViewCell() }
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.reuseIdentifier, for: indexPath) as? CurrencyTableViewCell else { return UITableViewCell() }
    if indexPath.row == 0 {
      cell.onValueChanged = { [weak self] (newValue) in
        self?.onValueChanged?(newValue)
      }
    } else {
      cell.onValueChanged = nil
    }
    let data = inputViewModel.currencies[indexPath.row]
    cell.configureCell(data: data)
    
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let inputViewModel = viewModel else { return }
    onSelected?(inputViewModel.currencies[indexPath.row])
  }
  
  func updateCells(in tableView: UITableView) {
    guard let inputViewModel = viewModel else { return }
    
    for indexPath in inputViewModel.indexPaths() {
      DispatchQueue.main.async {
        guard let cell = tableView.cellForRow(at: indexPath) as? CurrencyTableViewCell else { return }
        cell.configureCell(data: inputViewModel.currencies[indexPath.row])
      }
    }
  }
  

}
