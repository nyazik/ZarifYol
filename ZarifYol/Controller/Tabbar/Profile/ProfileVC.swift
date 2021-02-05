//
//  ProfileVC.swift
//  ZarifYol
//
//  Created by Nazik on 31.01.2021.
//

import UIKit
import SideMenu

class ProfileVC: UIViewController {

    @IBOutlet weak var favouriteTabbarView: UIView!
    @IBOutlet weak var tabbarView: UIView!
    @IBOutlet weak var myCartInsideView: UIView!
    @IBOutlet weak var myCartTabbarView: UIView!
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var profileMenuTableView: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var myCategoriesTabbarView: UIView!
    @IBOutlet weak var mainPageTabbarView: UIView!
    
    var accountDetailArray = ["Kişisel Bilgiler", "Siparişlerim", "Adreslerim", "Ödeme Bilgilerim", "Ayarlarım"]
    let images = [UIImage(named: "ic_profil"), UIImage(named: "ic_orders"),  UIImage(named: "ic_fav"), UIImage(named: "ic_card"), UIImage(named: "ic_settings") ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileMenuTableView.dataSource = self
        profileMenuTableView.delegate = self
        setupLayouts()
        setupSideMenu()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.addToCart(_:)))
        myCartTabbarView.addGestureRecognizer(tap)
        
        let secondTap = UITapGestureRecognizer(target: self, action: #selector(self.favouriteProduct(_:)))
        favouriteTabbarView.addGestureRecognizer(secondTap)
        
        let thirdTap = UITapGestureRecognizer(target: self, action: #selector(self.categories(_:)))
        myCategoriesTabbarView.addGestureRecognizer(thirdTap)
        
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
        configureRoundView(view: roundView)
        configureRoundView(view: profileImageView)
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

extension ProfileVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountDetailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:  indexPath) as! ProfileMenuCell
        cell.configureLayouts()
        cell.menuTextLabel.text  = accountDetailArray[indexPath.row]
        cell.prifileImageView.image = images[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let vc = self.storyboard?.instantiateViewController(identifier: "PersonalInformationVC") as! PersonalInformationVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }else if indexPath.row == 1{
            let vc = self.storyboard?.instantiateViewController(identifier: "MyOrdersVC") as! MyOrdersVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }else if indexPath.row == 2{
            let vc = self.storyboard?.instantiateViewController(identifier: "MyAddressesVC") as! MyAddressesVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }else if indexPath.row == 3{
            let vc = self.storyboard?.instantiateViewController(identifier: "SavedCreditCardsVC") as! SavedCreditCardsVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }else if indexPath.row == 4{
            let vc = self.storyboard?.instantiateViewController(identifier: "SettingsVC") as! SettingsVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}
