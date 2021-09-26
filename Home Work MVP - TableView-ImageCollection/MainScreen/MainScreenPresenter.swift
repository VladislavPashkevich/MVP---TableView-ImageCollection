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
    
    func addNewElementArray(data: Data)
    func removeElementArray(for indexPath: IndexPath)
    func numberOfElementsImagePickerArray() -> Int
    func elementInImagePickerArray(for indexPath: IndexPath) -> Data
    
}

class MainScreenPresenter: MainScreenPresenterProtocol {

    weak var view: MainScreenViewProtocol?
    
    private var imagePickerArray: [Data] = []

    func viewDidLoad() {

    }
    
    func addNewElementArray(data: Data) {
        imagePickerArray.append(data)
        view?.addElementToTableView(to: IndexPath(
            row: numberOfElementsImagePickerArray() - 1,
            section: 0))
        view?.trueIsHiddenLabelTextNoPhoto()
    }
    
    func removeElementArray(for indexPath: IndexPath) {
        imagePickerArray.remove(at: indexPath.row)
        view?.removeElementToTableView(to: indexPath)
        if imagePickerArray.count == 0 {
            view?.falseIsHiddenLabelTextNoPhoto()
        }
    }
    
    func numberOfElementsImagePickerArray() -> Int {
        return imagePickerArray.count
    }
    func elementInImagePickerArray(for indexPath: IndexPath) -> Data {
        return imagePickerArray[indexPath.row]
    }
    
   
}
