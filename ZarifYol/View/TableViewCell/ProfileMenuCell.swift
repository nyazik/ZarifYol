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
    
    func configureLayouts() {
        cellView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)
        cellView.layer.cornerRadius = 10
        cellView.backgroundColor = UIColor.white
    }
    
  
    
    
}
