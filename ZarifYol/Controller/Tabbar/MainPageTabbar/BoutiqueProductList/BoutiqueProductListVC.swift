//
//  BoutiqueProductListVC.swift
//  ZarifYol
//
//  Created by Nazik on 27.01.2021.
//

import UIKit

class BoutiqueProductListVC: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var boutiqueNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        
        boutiqueNameLabel.text = "KARAKOÇ GİYİM"
    }
        
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SearchVC") as! SearchVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func filterButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "FilteringCategoryVC") as! FilteringCategoryVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension BoutiqueProductListVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView{
            return 10
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BoutiqueCategoryCell
            cell.categoryNameLabel.text = "Kadin"
            cell.configureView()
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCell
            cell.newProductView.isHidden = false
            cell.productDescriptionLabel.text = "KARAKOÇ GİYİM Moleskin Seatle…"
            cell.salePersentageLabel.text = "%20 indirim"
            cell.previousPriceLabel.text = "120 ₺"
            cell.priceLabel.text = "90,50 ₺"
            cell.favouriteQuantityLabel.text = "111"
            cell.commentQuantityLabel.text = "134"
            cell.numberOfBoughtProductLabel.text = "105"
            cell.rateProductCosmosView.rating = 4
            cell.setupLayouts()
            //cell.configureView()
            return cell
            
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView{
            return CGSize.init(width: 100, height: 50)
        }else{
            let screenWidth = UIScreen.main.bounds.width
            var width = (screenWidth-30)/2
            width = width > 190 ? 190 : width
            return CGSize.init(width: width, height: 300)
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == productCollectionView{
            let vc = self.storyboard?.instantiateViewController(identifier: "BoutiqueProductDetailVC") as! BoutiqueProductDetailVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }else{
            return
        }
        
    }
    
    
}
