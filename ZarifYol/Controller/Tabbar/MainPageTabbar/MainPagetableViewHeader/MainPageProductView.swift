//
//  MainPageProductView.swift
//  ZarifYol
//
//  Created by Nazik on 5.02.2021.
//

import UIKit

class MainPageProductView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var startShoppingButton: UIButton!
    @IBOutlet var bgView: UIView!
    
    static var nib: UINib {
        return UINib(nibName: "MainPageProductView", bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func configureCell() {
        startShoppingButton.roundCorners(corners: [.topLeft, .topRight], radius: 10)
        startShoppingButton.backgroundColor = UIColor.white
    }
    
}
