//
//  SubCategoryCell.swift
//  ZarifYol
//
//  Created by Nazik on 29.01.2021.
//

import UIKit

class SubCategoryFilteringCell: UITableViewCell {

    @IBOutlet weak var filterinSubCategoryNameLabel: UILabel!
    @IBOutlet weak var checkmarkButton: UIButton!
    
    @IBAction func checkmarkButtonPressed(_ sender: UIButton) {
        if checkmarkButton.isSelected {
            checkmarkButton.isSelected = false
        }
        else {
            checkmarkButton.isSelected = true
        }
    
    }
}
