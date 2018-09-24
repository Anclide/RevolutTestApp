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
  
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindCollections()
        output.viewIsReady()
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardChangeFrame(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
  
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
  
  
    @objc func onKeyboardChangeFrame(notification: Notification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let duration:TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
            let animationCurve: UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
            if (endFrame?.origin.y)! >= UIScreen.main.bounds.size.height {
                //setup init constraints
                self.tableViewBottomConstraint.constant = 0.0
            } else {
                //setup new constraints
                self.tableViewBottomConstraint.constant = endFrame?.size.height ?? 0.0
            }
            UIView.animate(withDuration: duration,
                           delay: TimeInterval(0),
                           options: animationCurve,
                           animations: {
                              self.view.layoutIfNeeded()
            },
                           completion: nil)
      }
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
        tableViewMaker.updateCells(in: tableView)
    }
  
  
    func bindCollections() {
        tableView.register(UINib(nibName: CurrencyTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CurrencyTableViewCell.reuseIdentifier)
        tableView.dataSource = tableViewMaker
        tableView.delegate = tableViewMaker
        tableViewMaker.onValueChanged = { [weak self] (newValue) in
            self?.output.valueChanged(value: newValue)
        }
        tableViewMaker.onSelected = { [weak self] (model) in
          self?.output.handleNewBaseCurrencySelection(model: model)
        }
    }
}
