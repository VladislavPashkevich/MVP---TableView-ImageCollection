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
        
    }
}

extension MainScreenViewController: MainScreenViewProtocol {
    
}

extension MainScreenViewController: UITableViewDelegate {
    
}

extension MainScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
   
    
   
    
   
    
    
}
