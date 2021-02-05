//
//  BoutiqueProductCell.swift
//  ZarifYol
//
//  Created by Nazik on 27.01.2021.
//

import UIKit

class BoutiqueCategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    
    func configureView(){
        cellView.layer.cornerRadius = 10
        cellView.layer.backgroundColor = UIColor.white.cgColor
        cellView.layer.borderWidth = 1
        cellView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
}
