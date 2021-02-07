//
//  SubCategoryCell.swift
//  ZarifYol
//
//  Created by Nazik on 4.02.2021.
//

import UIKit

class SubCategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var subCategoryImageView: UIImageView!
    @IBOutlet weak var subCategoryNameLabel: UILabel!
    
    func configureCell() {
        subCategoryImageView.layer.cornerRadius = 10
    }
    
    
}
