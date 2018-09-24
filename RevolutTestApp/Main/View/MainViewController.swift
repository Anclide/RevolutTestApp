//
//  MainMainViewController.swift
//  RevolutTestApp
//
//  Created by victorbogatyrev on 20/09/2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainViewInput {

    var output: MainViewOutput!
    var tableViewMaker: TableViewMaker!
    var viewModel: Any?
  
    @IBOutlet weak var tableView: UITableView!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindCollections()
        output.viewIsReady()
    }


    // MARK: MainViewInput
    func setupInitialState(viewModel: MainViewModel) {
      self.viewModel = viewModel
      DispatchQueue.main.async { [weak self] in
        self?.tableView.reloadData()
      }
    }
  
    func updateViewModel(viewModel: MainViewModel) {
        self.viewModel = viewModel
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadRows(at: viewModel.indexPaths(), with: .none)
        }
    }
  
  
    func bindCollections() {
        tableView.register(UINib(nibName: CurrencyTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CurrencyTableViewCell.reuseIdentifier)
        tableView.dataSource = tableViewMaker
        tableView.delegate = tableViewMaker
    }
}
