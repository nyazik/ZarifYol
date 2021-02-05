//
//  CategoriesVC.swift
//  ZarifYol
//
//  Created by Nazik on 4.02.2021.
//

import UIKit
import SideMenu
class CategoriesVC: UIViewController {

    
    @IBOutlet weak var favouriteTabbarView: UIView!
    @IBOutlet weak var profileTabbarView: UIView!
    @IBOutlet weak var tabbarView: UIView!
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var subCategoryCollectionView: UICollectionView!
    @IBOutlet weak var myCartTabbarView: UIView!
    @IBOutlet weak var myCartInsideView: UIView!
    @IBOutlet weak var mainPageTabbarView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        
        subCategoryCollectionView.dataSource = self
        subCategoryCollectionView.delegate = self
        
        setupLayouts()
        
        setupSideMenu()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.addToCart(_:)))
        myCartTabbarView.addGestureRecognizer(tap)
        
        let secondTap = UITapGestureRecognizer(target: self, action: #selector(self.profileProduct(_:)))
        profileTabbarView.addGestureRecognizer(secondTap)
        
        let thirdTap = UITapGestureRecognizer(target: self, action: #selector(self.favouriteProduct(_:)))
        favouriteTabbarView.addGestureRecognizer(thirdTap)
        
        let forthTap = UITapGestureRecognizer(target: self, action: #selector(self.mainPage(_:)))
        mainPageTabbarView.addGestureRecognizer(forthTap)
    }
    
    @objc func mainPage(_ sender: UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(identifier: "MainPageVC") as! MainPageVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    @objc func favouriteProduct(_ sender: UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(identifier: "FavouriteProductsVC") as! FavouriteProductsVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    @objc func profileProduct(_ sender: UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ProfileVC") as! ProfileVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    @objc func addToCart(_ sender: UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(identifier: "AddToCartVC") as! AddToCartVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    func setupLayouts(){
        
        configureRoundView(view: myCartTabbarView)
        configureRoundView(view: myCartInsideView)
        configureShadow(view: myCartInsideView)
        configureTabbarShadow(view: tabbarView)
        configureTabbarShadow(view: myCartTabbarView)
    }

    func configureRoundView(view: UIView){
        view.layer.cornerRadius = view.frame.height / 2
    }
    
    func configureShadow(view: UIView){
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 3
    }
    
    func configureTabbarShadow(view: UIView){
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
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
        //var settings2 = MenuViewController()
        settings.blurEffectStyle = .light
        settings.presentationStyle = .menuSlideIn
        settings.pushStyle = .preserveAndHideBackButton
        settings.statusBarEndAlpha = 0
//        settings.presentationStyle.backgroundColor = UIColor.blue
        settings.presentationStyle.presentingEndAlpha = 0.7
        settings.presentationStyle.onTopShadowOpacity = 0.5
        settings.menuWidth = self.view.frame.width - self.view.frame.width * 0.3
        SideMenuManager.default.leftMenuNavigationController?.settings = settings
        SideMenuPresentationStyle.menuSlideIn.backgroundColor = UIColor.yellow
    }
    
}

extension CategoriesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryCell
        return cell
    }
    
    
}


extension CategoriesVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SubCategoryCell
        cell.configureCell()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize.init(width: 50, height: 50)
        return CGSize.init(width: (UIScreen.main.bounds.width - 160) / 2, height: (UIScreen.main.bounds.width - 100) / 2)
    }

    
}
