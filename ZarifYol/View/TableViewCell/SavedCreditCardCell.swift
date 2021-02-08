//
//  SavesCreditCardCell.swift
//  ZarifYol
//
//  Created by Nazik on 31.01.2021.
//

import UIKit

class SavedCreditCardCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var editCreditCardView: UIView!
    @IBOutlet weak var bankNameLabel: UILabel!
    @IBOutlet weak var numberOfCreditCardLabel: UILabel!
    
    func setupLayouts(){
        configureView(view: cellView)
    }
    
    func configureView(view: UIView) {
        view.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        view.layer.backgroundColor = UIColor.white.cgColor
    }

}
