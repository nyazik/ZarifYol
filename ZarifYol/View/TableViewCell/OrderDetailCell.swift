//
//  OrderDetailCell.swift
//  ZarifYol
//
//  Created by Nazik on 1.02.2021.
//

import UIKit

class OrderDetailCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var evaluateView: UIView!
    @IBOutlet weak var estimatedDeliveryDateLabel: UILabel!
    @IBOutlet weak var deliveryNumberLabel: UILabel!
    @IBOutlet weak var deliveryStatusLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    
    func configureLayouts(){
        configureCornerRadiusView(view: priceView)
        configureCornerRadius(view: evaluateView)
    }
    
    func configureCornerRadiusView(view: UIView){
        view.layer.cornerRadius = 10
    }
    
    func configureCornerRadius(view: UIView){
        view.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10)
    }
    
    
}
