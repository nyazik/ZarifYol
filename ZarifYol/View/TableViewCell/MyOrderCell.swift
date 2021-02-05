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
    @IBOutlet weak var ordersCollectonView: UICollectionView!
    
    var delegate: MyOrderCellDelegate?

    @IBOutlet weak var orderDetailButton: UIButton!
    
    func configureCell(){
        configureButton(button: orderDetailButton)
    }
    
    func configureButton(button: UIButton){
        button.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10)
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
        let screenWidth = UIScreen.main.bounds.width
        var width = (screenWidth-30)/2
        width = width > 190 ? 190 : width
        return CGSize.init(width: 60, height: 60)
    }
    
    
    
}
