//
//  ViewCellViewController.swift
//  Home Work MVP - TableView-ImageCollection
//
//  Created by Vladislav Pashkevich on 24.09.21.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet private weak var imageViewCell: UIImageView!
    
    func update(with data: Data) {
        
        imageViewCell.image = UIImage(data: data)
    }
}
