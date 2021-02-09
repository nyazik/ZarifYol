//
//  SubCategoryCell.swift
//  ZarifYol
//
//  Created by Nazik on 4.02.2021.
//

import UIKit

class SubCategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var subCategoryImageView: UIImageView!
    @IBOutlet weak var subCategoryNameLabel: UILabel!
    
    func configureCell() {
        cellView.layer.backgroundColor = UIColor.white.cgColor
        cellView.addShadow(color: .lightGray, opacity: 0.3, radius: 3)
        cellView.layer.cornerRadius = 5
    }
    
    
}
