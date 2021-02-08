//
//  MainPageProductCell.swift
//  ZarifYol
//
//  Created by Nazik on 5.02.2021.
//

import UIKit

class MainPageProductCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var addToCellOutsideView: UIView!
    @IBOutlet weak var addToCellInsideView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var previousPriceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var salePersentageLabel: UILabel!
    @IBOutlet weak var productStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configureCell() {
        cellView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)

        configureRoundView(view: addToCellOutsideView)
        addToCellOutsideView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)

        configureRoundView(view: addToCellInsideView)
        addToCellInsideView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)
    }
    
    func configureRoundView(view: UIView){
        view.layer.cornerRadius = view.frame.height / 2
        view.backgroundColor = UIColor.white
    }
    
}
