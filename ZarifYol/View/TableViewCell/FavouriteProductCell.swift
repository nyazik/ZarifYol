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
    
    func setupLayouts(){
        configureRoundCorners(view: chooseSizeDropDown)
        configureRoundCorner(view: addtoToCardView)
        configureRoundCorners(view: productImageView)
        chooseSizeDropDown.setLeftPaddingPoints(10)
    }
    
    func configureRoundCorners(view: UIView){
        view.layer.cornerRadius = 10
    }
    
    func configureRoundCorner(view: UIView){
        view.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10)
    }
    
}
