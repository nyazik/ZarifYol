//
//  CartCell.swift
//  ZarifYol
//
//  Created by Nazik on 30.01.2021.
//

import UIKit
import GMStepper

class CartCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var stepper: GMStepper!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productColorLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productSizeLabel: UILabel!
    
    func configureLayouts(){
        configureImageView(view: productImageView)
    }
    
    func configureImageView(view: UIView){
        view.layer.cornerRadius = 10
        stepper.buttonsFont = UIFont(name: "Century Gothic", size: 15.0)!
        stepper.labelFont = UIFont(name: "Century Gothic", size: 15.0)!
    }
    
}
