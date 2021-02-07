//
//  BoutiqueProductCell.swift
//  ZarifYol
//
//  Created by Nazik on 27.01.2021.
//

import UIKit

class BoutiqueCategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    func configureView(){
        cellView.layer.cornerRadius = 10
        cellView.layer.backgroundColor = UIColor.white.cgColor
        cellView.layer.borderWidth = 1
        cellView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
}
