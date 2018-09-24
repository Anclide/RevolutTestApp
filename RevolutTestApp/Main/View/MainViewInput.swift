//
//  MainMainViewInput.swift
//  RevolutTestApp
//
//  Created by victorbogatyrev on 20/09/2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

protocol MainViewInput: class, CollectionViewOwner {

    /**
        @author victorbogatyrev
        Setup initial state of the view
    */

    func setupInitialState(viewModel: MainViewModel)
  
    func updateViewModel(viewModel: MainViewModel)
}
