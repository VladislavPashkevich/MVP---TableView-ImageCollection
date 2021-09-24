//
//  StartScreenPresenter.swift
//  Home Work MVP - TableView-ImageCollection
//
//  Created Vladislav Pashkevich on 24.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit

// MARK: Presenter -
protocol StartScreenPresenterProtocol {
	var view: StartScreenViewProtocol? { get set }
    func viewDidLoad()
    
    func showMainScreenToButtonPress()
    
}

class StartScreenPresenter: StartScreenPresenterProtocol {

    weak var view: StartScreenViewProtocol?
    
    private var password: String = "vlad"

    func viewDidLoad() {

    }
    
    func showMainScreenToButtonPress() {
        let textFieldPassword = view?.compareValues()
        if password == textFieldPassword {
            view?.showMainScreen()
        }
    }

}
