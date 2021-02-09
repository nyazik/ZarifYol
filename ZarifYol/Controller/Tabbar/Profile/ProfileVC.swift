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
    @IBOutlet weak var profileNameSurnameLabel: UILabel!
    @IBOutlet weak var profileEmailLabel: UILabel!
    
    var accountDetailArray = ["Kişisel Bilgiler", "Siparişlerim", "Adreslerim", "Ödeme Bilgilerim", "Ayarlarım"]
    
    let images = [UIImage(named: "ic_profil"), UIImage(named: "ic_orders"),  UIImage(named: "ic_fav"), UIImage(named: "ic_card"), UIImage(named: "ic_settings") ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:- DELEGATES
        profileMenuTableView.dataSource = self
        profileMenuTableView.delegate = self
        
        setupLayouts()
        setupSideMenu()
        

        addGestureRecognizer(view: myCartTabbarView)
        addGestureRecognizer(view: favouriteTabbarView)
        addGestureRecognizer(view: myCategoriesTabbarView)
        addGestureRecognizer(view: mainPageTabbarView)

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
        case mainPageTabbarView:
            let vc = self.storyboard?.instantiateViewController(identifier: "MainPageVC") as! MainPageVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
        default:
            break
        }
    }
    

    func setupLayouts() {
        
        myCartInsideView.layer.cornerRadius = myCartInsideView.frame.height / 2
        myCartInsideView.addShadow(color: .lightGray, opacity: 0.3, radius: 3)
        myCartInsideView.layer.backgroundColor = UIColor.white.cgColor
        
        roundView.layer.cornerRadius = roundView.frame.height / 2
        
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        
        myCartTabbarView.layer.cornerRadius = myCartTabbarView.frame.height / 2
        myCartTabbarView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)

        tabbarView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)

        profileNameSurnameLabel.text = "Wook Web"
        profileEmailLabel.text = "info@wookweb.com"
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

extension ProfileVC: UITableViewDataSource, UITableViewDelegate {
    
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
