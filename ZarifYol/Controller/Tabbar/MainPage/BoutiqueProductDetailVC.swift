//
//  BoutiqueProductDetailVC.swift
//  ZarifYol
//
//  Created by Nazik on 2.02.2021.
//

import UIKit
import iOSDropDown

class BoutiqueProductDetailVC: UIViewController {

    @IBOutlet weak var pageIndicatorPageControl: UIPageControl!
    @IBOutlet weak var boutiqueProductDetailImageCollectionView: UICollectionView!
    @IBOutlet weak var productColorCollectionView: UICollectionView!
    @IBOutlet weak var chooseSizeDropDown: DropDown!
    @IBOutlet weak var chooseQuantityDropDown: DropDown!
    @IBOutlet weak var productsYouMayLikeCollectionView: UICollectionView!
    @IBOutlet weak var productCommentTableView: UITableView!
    @IBOutlet weak var commentTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    
    
    var imgArray = [UIImage(named: "ic_registerBackground"),
                    UIImage(named: "ic_registerBackground"),
                    UIImage(named: "ic_registerBackground"),
                    UIImage(named: "ic_registerBackground")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boutiqueProductDetailImageCollectionView.dataSource = self
        boutiqueProductDetailImageCollectionView.delegate = self
        
        productColorCollectionView.dataSource = self
        productColorCollectionView.delegate = self
        
        productsYouMayLikeCollectionView.dataSource = self
        productsYouMayLikeCollectionView.delegate = self
        
        productCommentTableView.dataSource = self
        productCommentTableView.delegate = self
        
        setupLayouts()
        
    
    }
    
    override func viewDidLayoutSubviews() {
        commentTableViewHeightConstraint.constant = CGFloat.greatestFiniteMagnitude
        self.productCommentTableView.reloadData()
        self.loadViewIfNeeded()
        commentTableViewHeightConstraint.constant = self.productCommentTableView.contentSize.height
    }
    
    func setupLayouts(){
        productColorCollectionView.isScrollEnabled = true
        pageIndicatorPageControl.numberOfPages = imgArray.count
        
        chooseSizeDropDown.setLeftPaddingPoints(10)
        chooseQuantityDropDown.setLeftPaddingPoints(10)
        
        confifureDropDown(dropDown: chooseSizeDropDown)
        confifureDropDown(dropDown: chooseQuantityDropDown)
        
        priceView.layer.cornerRadius = 10
        addToCartButton.roundCorners(corners: [.topLeft, .topRight], radius: addToCartButton.frame.height / 2)
        bottomView.addShadow(color: .lightGray, opacity: 0.5, radius: 10)
        bottomView.backgroundColor = UIColor.white
    }
    
      

    func confifureDropDown(dropDown: DropDown){
        dropDown.layer.cornerRadius = 10
    }
    
    
    @IBAction func allCommentsButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "AllCommentsVC") as! AllCommentsVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension BoutiqueProductDetailVC: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == boutiqueProductDetailImageCollectionView{
            return imgArray.count
        }else if collectionView == productColorCollectionView{
            return 5
        }else{
            return 10
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == boutiqueProductDetailImageCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BoutiqueProductImageCell
            cell.productImageView.image = imgArray[indexPath.row]
            return cell
        }else if collectionView == productColorCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BoutiqueProductColorCell
            cell.configureCell()
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductsYouMayLikeCell
            cell.configureCell()
            return cell
        }
        
    }

}


extension BoutiqueProductDetailVC: UICollectionViewDelegateFlowLayout{
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == boutiqueProductDetailImageCollectionView{
            let size  = collectionView.frame.size
            return CGSize(width: size.width, height: size.height)
        }else  if collectionView == productColorCollectionView{
            return CGSize(width: 50, height: 50)
        }else{
            return CGSize(width: 200, height: 250)
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == boutiqueProductDetailImageCollectionView{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else if collectionView == productColorCollectionView{

        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let cellWidth: CGFloat = flowLayout.itemSize.width
            let cellSpacing: CGFloat = flowLayout.minimumInteritemSpacing
            var cellCount = CGFloat(collectionView.numberOfItems(inSection: section))
            var collectionWidth = collectionView.frame.size.width
            var totalWidth: CGFloat
            if #available(iOS 11.0, *) {
                collectionWidth -= collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right
            }
            repeat {
                totalWidth = cellWidth * cellCount + cellSpacing * (cellCount - 1)
                cellCount -= 1
            } while totalWidth >= collectionWidth

            if (totalWidth > 0) {
                let edgeInset = (collectionWidth - totalWidth) / 2
                return UIEdgeInsets.init(top: flowLayout.sectionInset.top, left: edgeInset, bottom: flowLayout.sectionInset.bottom, right: edgeInset)
            } else {
                return flowLayout.sectionInset
            }
        }else{
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
            

        
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let center = CGPoint(x: scrollView.contentOffset.x + (scrollView.frame.width / 2), y: (scrollView.frame.height / 2))
        if let ip = boutiqueProductDetailImageCollectionView.indexPathForItem(at: center) {
                self.pageIndicatorPageControl.currentPage = ip.row
        }
    }
    
    
}



extension BoutiqueProductDetailVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}
