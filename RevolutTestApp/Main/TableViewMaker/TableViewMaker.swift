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
    
    let data = inputViewModel.currencies[indexPath.row]
    cell.configureCell(data: data)
    
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  

}
