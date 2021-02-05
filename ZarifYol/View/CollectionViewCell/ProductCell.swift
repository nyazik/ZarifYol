//
//  ProductCell.swift
//  ZarifYol
//
//  Created by Nazik on 27.01.2021.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var newView: UIView!
    @IBOutlet weak var favView: UIView!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var saleStackView: UIStackView!

    func setupLayouts(){
        configureRoundView(view: favView)
        configureShadow(view: favView)
        
        configureCornerRadiusView(view: newView)
        
        configureCornerRadiusView(view: priceView)
        
        configureViewCornerRadius(view: cellView)
        configureBorder(view: cellView)
        cellView.clipsToBounds = true
        
        saleStackView.isHidden = true
    }
    
    func configureRoundView(view: UIView){
        view.layer.cornerRadius = view.frame.height / 2
    }
    
    func configureCornerRadiusView(view:  UIView){
        view.layer.cornerRadius = 10
    }
    func configureViewCornerRadius(view: UIView) {
        view.layer.cornerRadius = 15
    }
    
    func configureBorder(view: UIView){
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
    }
    
    func configureShadow(view: UIView){
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
    }
    
}
