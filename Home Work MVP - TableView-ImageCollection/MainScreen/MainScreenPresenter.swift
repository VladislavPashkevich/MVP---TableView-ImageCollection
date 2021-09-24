//
//  MainScreenPresenter.swift
//  Home Work MVP - TableView-ImageCollection
//
//  Created Vladislav Pashkevich on 24.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: Presenter -
protocol MainScreenPresenterProtocol {
	var view: MainScreenViewProtocol? { get set }
    func viewDidLoad()
}

class MainScreenPresenter: MainScreenPresenterProtocol {

    weak var view: MainScreenViewProtocol?

    func viewDidLoad() {

    }
}
