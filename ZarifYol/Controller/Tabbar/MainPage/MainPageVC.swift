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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DELEGATE
        categoriesCollectionTableView.dataSource = self
        categoriesCollectionTableView.delegate = self
        
        brandsTableView.dataSource = self
        brandsTableView.delegate = self
        
        setupLayouts()
        
        setupSideMenu()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.addToCart(_:)))
        myCartTabbarView.addGestureRecognizer(tap)
        
        let secondTap = UITapGestureRecognizer(target: self, action: #selector(self.profileProduct(_:)))
        profileTabbarView.addGestureRecognizer(secondTap)
        
        let thirdTap = UITapGestureRecognizer(target: self, action: #selector(self.categories(_:)))
        myCategoriesTabbarView.addGestureRecognizer(thirdTap)
        
        let forthTap = UITapGestureRecognizer(target: self, action: #selector(self.favouriteProduct(_:)))
        favouriteTabbarView.addGestureRecognizer(forthTap)
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
    
    @objc func categories(_ sender: UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(identifier: "CategoriesVC") as! CategoriesVC
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


extension MainPageVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}

extension MainPageVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoriesCell
        cell.configureView()
        return cell
    }
    
    
}
