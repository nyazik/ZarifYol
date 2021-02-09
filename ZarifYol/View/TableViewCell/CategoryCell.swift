//
//  CategoryCell.swift
//  ZarifYol
//
//  Created by Nazik on 4.02.2021.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        reload()
    }
    
    func reload() {
        if isSelected {
            cellView.backgroundColor  = UIColor.white
            cellView.layer.borderColor = UIColor.orange.cgColor
            cellView.layer.borderWidth = 2
        }
        
        else {
//            cellView.backgroundColor  = UIColor.red
            cellView.backgroundColor  = UIColor.white
            cellView.layer.borderColor = UIColor.white.cgColor
            cellView.layer.borderWidth = 2

        }
    }


    func configureCell(){
        cellView.layer.backgroundColor = UIColor.white.cgColor
        cellView.layer.cornerRadius = 5
        cellView.addShadow(color: .lightGray, opacity: 0.3, radius: 3)
        categoryImageView.layer.cornerRadius = 5
    }
}
