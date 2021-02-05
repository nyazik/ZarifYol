//
//  CategoriesCell.swift
//  ZarifYol
//
//  Created by Nazik on 27.01.2021.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    
    func configureView(){
        cellView.layer.cornerRadius = 10
        cellView.layer.backgroundColor = UIColor.white.cgColor
    }
    
}
