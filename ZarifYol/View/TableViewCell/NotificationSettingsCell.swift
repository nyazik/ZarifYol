//
//  NotificationSettingsCell.swift
//  ZarifYol
//
//  Created by Nazik on 31.01.2021.
//

import UIKit

class NotificationSettingsCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    
    func configureLayouts(){
        configureView(view: cellView)
    }

    func configureView(view: UIView){
        view.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
    }
}
