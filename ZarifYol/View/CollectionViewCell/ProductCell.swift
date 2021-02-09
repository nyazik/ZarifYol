//
//  ProductCell.swift
//  ZarifYol
//
//  Created by Nazik on 27.01.2021.
//

import UIKit
import Cosmos

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var newView: UIView!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var saleStackView: UIStackView!
    @IBOutlet weak var newProductView: UIView!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var salePersentageLabel: UILabel!
    @IBOutlet weak var previousPriceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favouriteQuantityLabel: UILabel!
    @IBOutlet weak var commentQuantityLabel: UILabel!
    @IBOutlet weak var numberOfBoughtProductLabel: UILabel!
    @IBOutlet weak var rateProductCosmosView: CosmosView!
    @IBOutlet weak var favButton: UIButton!

    func setupLayouts() {
        
        favButton.layer.cornerRadius = favButton.frame.height / 2
        favButton.layer.backgroundColor = UIColor.white.cgColor
        favButton.addShadow(color: .lightGray, opacity: 0.5, radius: 5)

        newView.layer.cornerRadius = 10
        priceView.layer.cornerRadius = 10
        
        cellView.layer.cornerRadius = 10
        cellView.clipsToBounds = true
        cellView.layer.borderColor = UIColor.lightGray.cgColor
        cellView.layer.borderWidth = 1
        
        saleStackView.isHidden = true
        newProductView.isHidden = false
    }
    
    
    @IBAction func favButtonPressed(_ sender: UIButton) {
        if favButton.isSelected {
            favButton.isSelected = false
        }
        else {
            favButton.isSelected = true
        }
    }
    
}
