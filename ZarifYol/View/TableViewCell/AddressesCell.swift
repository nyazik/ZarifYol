//
//  AddressesCell.swift
//  ZarifYol
//
//  Created by Nazik on 31.01.2021.
//

import UIKit

class AddressesCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var editAddressView: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    func setupLayouts(){
        configureView(view: cellView)
    }
    
    func configureView(view: UIView){
        view.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        view.layer.backgroundColor = UIColor.white.cgColor
    }

}
