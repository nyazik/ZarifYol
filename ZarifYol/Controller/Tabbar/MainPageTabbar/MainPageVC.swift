//
//  MainPageVC.swift
//  ZarifYol
//
//  Created by Nazik on 27.01.2021.
//

import UIKit
import SideMenu

class MainPageVC: UIViewController {
    
    @IBOutlet weak var profileTabbarView: UIView!
    @IBOutlet weak var favouriteTabbarView: UIView!
    @IBOutlet weak var tabbarView: UIView!
    @IBOutlet weak var myCartInsideView: UIView!
    @IBOutlet weak var myCartTabbarView: UIView!
    @IBOutlet weak var myCategoriesTabbarView: UIView!
    @IBOutlet weak var categoriesCollectionTableView: UICollectionView!
    @IBOutlet weak var brandsTableView: UITableView!
    
    var arrayHeader = [0, 0, 0, 0, 0 , 0, 0]
    
    var  selectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- DELEGATES
        categoriesCollectionTableView.dataSource = self
        categoriesCollectionTableView.delegate = self
        
        brandsTableView.dataSource = self
        brandsTableView.delegate = self
        
        setupLayouts()
        
        setupSideMenu()
        
        //MARK:- GESTURE RECOGNIZER
        addGestureRecognizer(view: myCartTabbarView)
        addGestureRecognizer(view: favouriteTabbarView)
        addGestureRecognizer(view: myCategoriesTabbarView)
        addGestureRecognizer(view: profileTabbarView)
        
        
        //MARK:- REGISTER NIB
        brandsTableView.register(UINib(nibName: "MainPageProductView", bundle: nil), forHeaderFooterViewReuseIdentifier: "cell")
        brandsTableView.register(UINib(nibName: "MainPageProductCell", bundle: nil), forCellReuseIdentifier: "cell")
        brandsTableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "headerCell")
    }
    
    func addGestureRecognizer(view: UIView) {
        view.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.gestureRecognizerMethods(_:)))
        view.addGestureRecognizer(gesture)
    }
    
    @objc func gestureRecognizerMethods(_ sender: UITapGestureRecognizer) {
        switch sender.view {
        case myCartTabbarView:
            let vc = self.storyboard?.instantiateViewController(identifier: "AddToCartVC") as! AddToCartVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
        case favouriteTabbarView:
            let vc = self.storyboard?.instantiateViewController(identifier: "FavouriteProductsVC") as! FavouriteProductsVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
        case myCategoriesTabbarView:
            let vc = self.storyboard?.instantiateViewController(identifier: "CategoriesVC") as! CategoriesVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
        case profileTabbarView:
            let vc = self.storyboard?.instantiateViewController(identifier: "ProfileVC") as! ProfileVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
        default:
            break
        }
    }
    
    
    
    func setupLayouts() {
        
        myCartInsideView.layer.backgroundColor = UIColor.white.cgColor
        myCartInsideView.layer.cornerRadius = myCartInsideView.frame.height / 2
        myCartInsideView.addShadow(color: .lightGray, opacity: 0.3, radius: 3)
        
        tabbarView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)
        
        myCartTabbarView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)
        myCartTabbarView.layer.cornerRadius = myCartTabbarView.frame.height / 2
        
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SearchVC") as! SearchVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func notificationButtonPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "NotificationVC") as! NotificationVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func menuButtonPressed(_ sender: UIButton) {
        let menu = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! SideMenuNavigationController
        settingsSetupSlide()
        present(menu, animated: true, completion: nil)
    }
    
    private func setupSideMenu() {
        // Define menus
        SideMenuManager.default.leftMenuNavigationController = storyboard?.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? SideMenuNavigationController
        settingsSetupSlide()
    }
    
    //menuDissolveIn
    func settingsSetupSlide() {
        // Enable gestures
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: view, forMenu: .left)
        var settings = SideMenuSettings()
        settings.blurEffectStyle = .light
        settings.presentationStyle = .menuSlideIn
        settings.pushStyle = .preserveAndHideBackButton
        settings.statusBarEndAlpha = 0
        settings.presentationStyle.presentingEndAlpha = 0.7
        settings.presentationStyle.onTopShadowOpacity = 0.5
        settings.menuWidth = self.view.frame.width - self.view.frame.width * 0.3
        SideMenuManager.default.leftMenuNavigationController?.settings = settings
        SideMenuPresentationStyle.menuSlideIn.backgroundColor = UIColor.yellow
    }
    
}


extension MainPageVC: UITableViewDataSource, UITableViewDelegate, SeeAllProductsCellDelegate{
    
    func didSeeAllProductsButtonPressed(tag: Int) {
        let vc = self.storyboard?.instantiateViewController(identifier: "BoutiqueProductListVC") as! BoutiqueProductListVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func tapSection(sender: UIButton) {
        //        self.arrayHeader[sender.tag] = (self.arrayHeader[sender.tag] == 1) ? 0 : 1
        //        self.selectedIndex = sender.tag
        if self.selectedIndex == sender.tag {
            self.selectedIndex = nil
        } else {
            self.selectedIndex = sender.tag
        }
        //        self.brandsTableView.reloadSections(indexSet,  with: .fade)
        self.brandsTableView.reloadSections(IndexSet(0..<brandsTableView.numberOfSections), with: .fade)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedIndex == section ? 4 : 0
        //        return (self.arrayHeader[section] == 0) ? 0 : 3
    }
    
    @objc func addToCartTapped(_ sender: UITapGestureRecognizer){
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainPageProductCell
            cell.productDescriptionLabel.text = "Erkek Ultra Hafif Kışlık Mont"
            cell.previousPriceLabel.text = "120₺"
            cell.priceLabel.text = "90,50₺"
            cell.salePersentageLabel.text = "-%20"
            cell.productStatus.text = "YENİ"
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.addToCartTapped(_:)))
            cell.addToCellOutsideView.addGestureRecognizer(tapGesture)
            cell.configureCell()
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "BoutiqueProductDetailVC") as! BoutiqueProductDetailVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 50
        } else {
            return 140
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    // 5
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayHeader.count
    }
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "cell") as? MainPageProductView {
            headerView.configureCell()
            headerView.startShoppingButton.tag = section
            headerView.startShoppingButton.addTarget(self, action: #selector(tapSection(sender:)), for: .touchUpInside)
            return headerView
        }
        
        return nil
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    
}


extension MainPageVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoriesCell
        cell.categoryNameLabel.text = "erkek"
        cell.configureCell()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 100, height: 50)
        
        
    }
    
}
