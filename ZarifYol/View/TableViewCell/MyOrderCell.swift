//
//  MyOrderCell.swift
//  ZarifYol
//
//  Created by Nazik on 1.02.2021.
//

import UIKit


protocol MyOrderCellDelegate {
    func didOrderButtonPressed(tag: Int)
}

class MyOrderCell: UITableViewCell {
    
    var delegate: MyOrderCellDelegate?
    
    @IBOutlet weak var ordersCollectonView: UICollectionView!
    @IBOutlet weak var orderDetailButton: UIButton!
    @IBOutlet weak var dateOfOrderLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var orderStatus: UILabel!
    
    
    func configureCell() {
        orderDetailButton.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ordersCollectonView.dataSource = self
        ordersCollectonView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @IBAction func orderDetailButtonPressed(_ sender: UIButton) {
        delegate?.didOrderButtonPressed(tag: sender.tag)
    }
    
}


extension MyOrderCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OrderPreviewCell
        cell.configureCell()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 60, height: 60)
    }
    
  
    
}
