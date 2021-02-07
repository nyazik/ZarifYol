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
    @IBOutlet weak var favView: UIView!
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
    
    func setupLayouts(){
        
        favView.layer.cornerRadius = favView.frame.height / 2
        favView.layer.backgroundColor = UIColor.white.cgColor
        favView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)

        configureCornerRadius(view: newView)
        configureCornerRadius(view: priceView)
        configureCornerRadius(view: cellView)

        cellView.clipsToBounds = true
        configureBorder(view: cellView)
        
        saleStackView.isHidden = true
        newProductView.isHidden = false
    }
    
    
    func configureBorder(view: UIView){
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
    }
    
    func configureCornerRadius(view: UIView){
        view.layer.cornerRadius = 10
    }
   
}
