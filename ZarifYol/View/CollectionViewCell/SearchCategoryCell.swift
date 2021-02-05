//
//  SearchCategoryCell.swift
//  ZarifYol
//
//  Created by Nazik on 30.01.2021.
//

import UIKit

class SearchCategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    
    func configureLayouts(){
        configureShadow(view: cellView)
    }
    
    func configureShadow(view: UIView){
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 3
    }
    
}
