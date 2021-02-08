//
//  OrderPreviewCell.swift
//  ZarifYol
//
//  Created by Nazik on 1.02.2021.
//

import UIKit

class OrderPreviewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    
    func configureCell() {
        cellView.layer.cornerRadius = 10
        productImageView.layer.cornerRadius = 10
    }
    
    
    
}
