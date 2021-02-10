//
//  BoutiqueProductDetailVC.swift
//  ZarifYol
//
//  Created by Nazik on 2.02.2021.
//

import UIKit
import iOSDropDown

class BoutiqueProductDetailVC: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var previousPriceLabel: UILabel!
    @IBOutlet weak var allCommentsButton: UIButton!
    @IBOutlet weak var numberOfBoughtProductLabel: UILabel!
    @IBOutlet weak var commentsQuantityLabel: UILabel!
    @IBOutlet weak var favouriteProductQuantityLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var pageIndicatorPageControl: UIPageControl!
    @IBOutlet weak var boutiqueProductDetailImageCollectionView: UICollectionView!
    @IBOutlet weak var productColorCollectionView: UICollectionView!
    @IBOutlet weak var chooseSizeDropDown: DropDown!
    @IBOutlet weak var chooseQuantityDropDown: DropDown!
    @IBOutlet weak var productsYouMayLikeCollectionView: UICollectionView!
    @IBOutlet weak var productCommentTableView: UITableView!
    @IBOutlet weak var commentTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var salePersentageLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    
    var imgArray = [UIImage(named: "ic_registerBackground"),
                    UIImage(named: "ic_registerBackground"),
                    UIImage(named: "ic_registerBackground"),
                    UIImage(named: "ic_registerBackground")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- DELEGATE
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
    
    func setupLayouts() {
        productColorCollectionView.isScrollEnabled = true
        pageIndicatorPageControl.numberOfPages = imgArray.count
        
        chooseSizeDropDown.setLeftPaddingPoints(10)
        chooseSizeDropDown.layer.cornerRadius = 10
        chooseSizeDropDown.optionArray = ["qwer", "34567"]
        chooseSizeDropDown.arrowColor = .orange
        chooseSizeDropDown.checkMarkEnabled = false
        
        chooseQuantityDropDown.setLeftPaddingPoints(10)
        chooseQuantityDropDown.layer.cornerRadius = 10
        chooseQuantityDropDown.optionArray = ["qwer", "34567"]
        chooseQuantityDropDown.arrowColor = .orange
        chooseQuantityDropDown.checkMarkEnabled = false
        
        //priceView.layer.cornerRadius = 10
        
        addToCartButton.roundCorners(corners: [.topLeft, .topRight], radius: 15)
        
        bottomView.addShadow(color: .lightGray, opacity: 0.5, radius: 10)
        bottomView.backgroundColor = UIColor.white
        
        productDescriptionLabel.text = "KARAKOÇ GİYİM Moleskin Seatle Gömlek"
        favouriteProductQuantityLabel.text = "111"
        numberOfBoughtProductLabel.text = "105"
        allCommentsButton.titleLabel?.text = "Tümünü Gör (324)"
        previousPriceLabel.text = "120₺"
        priceLabel.text = "90,50 ₺"
        salePersentageLabel.text = "Sepette %10 indirim"
    }
    
    
    @IBAction func allCommentsButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "AllCommentsVC") as! AllCommentsVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToCartButtonPressed(_ sender: UIButton) {
        
    }
    
}

extension BoutiqueProductDetailVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == boutiqueProductDetailImageCollectionView{
            let vc = self.storyboard?.instantiateViewController(identifier: "BoutiqueProductDetailVC") as! BoutiqueProductDetailVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }else if collectionView == productsYouMayLikeCollectionView{
            let vc = self.storyboard?.instantiateViewController(identifier: "BoutiqueProductDetailVC") as! BoutiqueProductDetailVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }else{
            
        }
        
        
    }
    
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
            cell.productColorImageView.image = #imageLiteral(resourceName: "ic_registerBackground")
            cell.configureCell()
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductsYouMayLikeCell
            cell.productLabel.text = "Oduncu Gömlek"
            cell.categoryLabel.text = "Gömlek"
            cell.configureCell()
            return cell
        }
        
    }
    
    
    
}


extension BoutiqueProductDetailVC: UICollectionViewDelegateFlowLayout {
    
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



extension BoutiqueProductDetailVC: UITableViewDataSource, UITableViewDelegate {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AllCommentsInBoutiqueProductCell
        cell.commentBodyLabel.text = "Erkek arkadaşım için aldığım bu gömleği çok severek giyiyor. Fiyatını  hakeden bir gömlek."
        cell.commentDateLabel.text = "24 Kasım 2020   I  12:47"
        return cell
    }
    
    
}
