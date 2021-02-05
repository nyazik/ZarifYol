//
//  ProductsYouMayLikeCell.swift
//  ZarifYol
//
//  Created by Nazik on 3.02.2021.
//

import UIKit

class ProductsYouMayLikeCell: UICollectionViewCell {
    
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var productYouMayLikeImageView: UIImageView!
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    func configureCell() {
        
        productView.layer.cornerRadius = 10
        productView.addShadow(color: .lightGray, opacity: 0.5, radius: 5.0)
        productView.backgroundColor = .white
    }
    
    
    
}
