//
//  BoutiqueProductColorCell.swift
//  ZarifYol
//
//  Created by Nazik on 3.02.2021.
//

import UIKit

class BoutiqueProductColorCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var productColorImageView: UIImageView!
    
    func configureCell(){
        cellView.layer.cornerRadius = 5
        productColorImageView.layer.cornerRadius = 5
    }
    
    
}
