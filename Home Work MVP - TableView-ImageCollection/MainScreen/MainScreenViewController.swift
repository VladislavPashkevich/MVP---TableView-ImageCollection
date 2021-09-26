//
//  MainScreenViewController.swift
//  Home Work MVP - TableView-ImageCollection
//
//  Created Vladislav Pashkevich on 24.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
// MARK: View -
protocol MainScreenViewProtocol: AnyObject {
        
    func addElementToTableView(to indexPath: IndexPath)
    
    func removeElementToTableView(to indexPath: IndexPath)
    
    func trueIsHiddenLabelTextNoPhoto()
    
    func falseIsHiddenLabelTextNoPhoto()

}

class MainScreenViewController: UIViewController {
    
    @IBOutlet private weak var labelTextNoPhoto: UILabel!
    @IBOutlet private weak var tableView: UITableView!
        
    

	var presenter: MainScreenPresenterProtocol = MainScreenPresenter()
    
	override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self
        presenter.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "TableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @IBAction func addPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
}

extension MainScreenViewController: MainScreenViewProtocol {
    
    func addElementToTableView(to indexPath: IndexPath) {
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    func removeElementToTableView(to indexPath: IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func trueIsHiddenLabelTextNoPhoto() {
        labelTextNoPhoto.isHidden = true
    }
    
    func falseIsHiddenLabelTextNoPhoto() {
        labelTextNoPhoto.isHidden = false
    }
    
}

extension MainScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [
            UIContextualAction(
                style: .destructive,
                title: "Delete",
                handler: { _, _, _ in
                    self.presenter.removeElementArray(for: indexPath)
                })
        ])
        return configuration
    }
}



extension MainScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfElementsImagePickerArray()
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.update(with: presenter.elementInImagePickerArray(for: indexPath))
        return cell
    }
    
}



extension MainScreenViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        guard let imageData = image.pngData() else { return }
        presenter.addNewElementArray(data: imageData)
    }
}




