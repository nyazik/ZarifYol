//
//  NotificationSettingsCell.swift
//  ZarifYol
//
//  Created by Nazik on 31.01.2021.
//

import UIKit

class NotificationSettingsCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var notificationSettingCellLabel: UILabel!
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var notificaationSettingCellRuleLabel: UILabel!
    
    
    
    func configureLayouts(){
        configureView(view: cellView)
    }

    func configureView(view: UIView){
        view.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        cellView.backgroundColor = UIColor.white
    }
    
    @IBAction func switchButtonPressed(_ sender: UIButton) {
        if switchButton.isSelected {
            switchButton.isSelected = false
        }
        else {
            switchButton.isSelected = true
        }
    }
    
}
