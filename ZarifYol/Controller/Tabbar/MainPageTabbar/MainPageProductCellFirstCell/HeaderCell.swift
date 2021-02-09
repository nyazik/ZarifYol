//
//  HeaderCell.swift
//  ZarifYol
//
//  Created by Nazik on 9.02.2021.
//

import UIKit

protocol SeeAllProductsCellDelegate {
    func didSeeAllProductsButtonPressed(tag: Int)
}
class HeaderCell: UITableViewCell {

    var delegate: SeeAllProductsCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func seeAllProductsButtonPressed(_ sender: UIButton){
        delegate?.didSeeAllProductsButtonPressed(tag: sender.tag)
    }
    
}
