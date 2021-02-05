//
//  ProfileMenuCell.swift
//  ZarifYol
//
//  Created by Nazik on 31.01.2021.
//

import UIKit

class ProfileMenuCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var menuTextLabel: UILabel!
    @IBOutlet weak var prifileImageView: UIImageView!
    
    func configureLayouts(){
        configureRoundCornerView(view: cellView)
        configureShadow(view: cellView)
    }
    
    func configureRoundCornerView(view: UIView){
        view.layer.cornerRadius = 10
    }
    
    func configureShadow(view: UIView){
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
    }
    
}
