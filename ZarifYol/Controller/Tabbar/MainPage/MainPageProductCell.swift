//
//  MainPageProductCell.swift
//  ZarifYol
//
//  Created by Nazik on 5.02.2021.
//

import UIKit

class MainPageProductCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var addToCellOutsideView: UIView!
    @IBOutlet weak var addToCellInsideView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(){
        configureRoundView(view: addToCellOutsideView)
        configureRoundView(view: addToCellInsideView)
        cellView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)
    }
    
    func configureRoundView(view: UIView){
        view.layer.cornerRadius = view.frame.height / 2
        view.addShadow(color: .lightGray, opacity: 0.5, radius: 5)
        view.backgroundColor = UIColor.white
    }
    
}
