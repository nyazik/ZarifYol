//
//  FavouriteProductCell.swift
//  ZarifYol
//
//  Created by Nazik on 30.01.2021.
//

import UIKit
import iOSDropDown
import Cosmos

class FavouriteProductCell: UITableViewCell {

    @IBOutlet weak var chooseSizeDropDown: DropDown!
    @IBOutlet weak var ratingBarCosmosView: CosmosView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var addtoToCardView: UIView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productColorLabel: UILabel!
    @IBOutlet weak var productSizeLabel: UILabel!
    
    
    func setupLayouts() {
        chooseSizeDropDown.layer.cornerRadius = 10
        productImageView.layer.cornerRadius = 10
        chooseSizeDropDown.setLeftPaddingPoints(10)
        addtoToCardView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10)

    }
    
    
    @IBAction func deleteFavouriteProductButtonPressed(_ sender: UIButton) {
        
    }
    
    
}
