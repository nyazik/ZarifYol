//
//  SubCategoryCell.swift
//  ZarifYol
//
//  Created by Nazik on 4.02.2021.
//

import UIKit

class SubCategoryCell: UICollectionViewCell {
    @IBOutlet weak var subCategoryImageView: UIImageView!
    
    func configureCell() {
        subCategoryImageView.layer.cornerRadius = 10
    }
    
    
}
