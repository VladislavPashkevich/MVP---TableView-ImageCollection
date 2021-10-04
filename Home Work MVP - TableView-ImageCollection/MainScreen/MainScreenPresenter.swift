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
    
    private var imagesPickerArray: [ArrayData] = []
    
    func viewDidLoad() {
        
        DatabaseService.shared.entitiesFor(
            type: ArrayData.self,
            context: DatabaseService.shared.persistentContainer.mainContext,
            closure: { [weak self] arrayDataCore in
                guard let self =  self else { return }
                self.imagesPickerArray = arrayDataCore
                self.view?.reloadTableView()
                if arrayDataCore.isEmpty {
                    self.view?.falseIsHiddenLabelTextNoPhoto()
                } else {
                    self.view?.trueIsHiddenLabelTextNoPhoto()
                }
            }
        )
    }
    
    func addNewElementArray(data: Data) {
        
        DatabaseService.shared.insertEntityFor(
            type: ArrayData.self,
            context: DatabaseService.shared.persistentContainer.mainContext,
            closure: { [weak self] arrayDataCore in
                guard let self =  self else { return }
                arrayDataCore.imageArrayData = NSData(data: data)
                
                DatabaseService.shared.saveMain({
                    self.imagesPickerArray.append(arrayDataCore)
                    self.view?.addElementToTableView(to: IndexPath(
                        row: self.numberOfElementsImagePickerArray() - 1,
                        section: 0))
                    self.view?.trueIsHiddenLabelTextNoPhoto()
                })
            }
        )
        
    }
    
    func removeElementArray(for indexPath: IndexPath) {
        
        DatabaseService.shared.delete(imagesPickerArray[indexPath.row], context: DatabaseService.shared.persistentContainer.mainContext, closure: { [weak self] _ in
            guard let self =  self else { return }
            DatabaseService.shared.saveMain({
                self.imagesPickerArray.remove(at: indexPath.row)
                self.view?.removeElementToTableView(to: indexPath)
                if self.imagesPickerArray.count == 0 {
                    self.view?.falseIsHiddenLabelTextNoPhoto()
                }
            })
        })
    }
    
    func numberOfElementsImagePickerArray() -> Int {
        return imagesPickerArray.count
    }
    func elementInImagePickerArray(for indexPath: IndexPath) -> Data {
        return imagesPickerArray[indexPath.row].imageArrayData as Data
    }
    
    
}
