//
//  MainMainViewOutput.swift
//  RevolutTestApp
//
//  Created by victorbogatyrev on 20/09/2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

protocol MainViewOutput {

    /**
        @author victorbogatyrev
        Notify presenter that view is ready
    */

    func viewIsReady()
  
    func valueChanged(value: Double)
}
