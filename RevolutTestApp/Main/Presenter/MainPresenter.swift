//
//  MainMainPresenter.swift
//  RevolutTestApp
//
//  Created by victorbogatyrev on 20/09/2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

class MainPresenter: MainModuleInput, MainViewOutput, MainInteractorOutput {

    weak var view: MainViewInput!
    var interactor: MainInteractorInput!
    var router: MainRouterInput!

    func viewIsReady() {
      interactor.prepareData()
    }
  
    func setupOnlaunch(viewModel: MainViewModel) {
        view.setupInitialState(viewModel: viewModel)
    }
  
    func viewModelPrepared(viewModel: MainViewModel) {
        view.updateViewModel(viewModel: viewModel)
    }
}
