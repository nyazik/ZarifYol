//
//  SearchCategoryCell.swift
//  ZarifYol
//
//  Created by Nazik on 30.01.2021.
//

import UIKit

class PopularSearchResultCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var popularSearchResultLabel: UILabel!

    func configureLayouts() {
        cellView.addShadow(color: .lightGray, opacity: 0.3, radius: 3)
        cellView.backgroundColor = UIColor.white
        cellView.layer.cornerRadius = 10
    }
    
}
