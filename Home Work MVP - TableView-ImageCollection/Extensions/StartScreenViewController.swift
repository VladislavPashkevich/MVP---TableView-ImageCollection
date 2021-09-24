//
//  StartScreenViewController.swift
//  Home Work MVP - TableView-ImageCollection
//
//  Created Vladislav Pashkevich on 24.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
// MARK: View -
protocol StartScreenViewProtocol: AnyObject {
    func compareValues() -> String
    func showMainScreen()

}

class StartScreenViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!

	var presenter: StartScreenPresenterProtocol = StartScreenPresenter()

	override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self
        presenter.viewDidLoad()
    }
    
    @IBAction func pressLoginButton() {
        presenter.showMainScreenToButtonPress()
    }
}

extension StartScreenViewController: StartScreenViewProtocol {
    func compareValues() -> String {
        return "\(textField.text ?? "")"
      
    }
    
    func showMainScreen() {
        let storyboard = UIStoryboard(name: "Storyboard", bundle: Bundle.main)
        guard let mainScreen = storyboard.instantiateViewController(identifier: "MainScreenViewController") as? MainScreenViewController else { return }
        present(mainScreen, animated: true, completion: nil)
    }
}
