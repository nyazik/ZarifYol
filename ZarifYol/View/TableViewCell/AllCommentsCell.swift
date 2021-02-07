//
//  AllCommentsCell.swift
//  ZarifYol
//
//  Created by Nazik on 1.02.2021.
//

import UIKit
import Cosmos

class AllCommentsCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var rateProductCosmosView: CosmosView!
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var commentDateLabel: UILabel!
    @IBOutlet weak var commentBodyLabel: UILabel!
    
    
    @IBAction func likeCommentButtonPressed(_ sender: UIButton) {
        
    }
    
}
