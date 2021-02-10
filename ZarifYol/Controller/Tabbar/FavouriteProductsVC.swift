//
//  FavouriteProductsVC.swift
//  ZarifYol
//
//  Created by Nazik on 30.01.2021.
//

import UIKit
import SideMenu

class FavouriteProductsVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var profileTabbarView: UIView!
    @IBOutlet weak var favouriteTabbarView: UIView!
    @IBOutlet weak var tabbarView: UIView!
    @IBOutlet weak var myCartInsideView: UIView!
    @IBOutlet weak var myCartTabbarView: UIView!
    @IBOutlet weak var myCategoriesTabbarView: UIView!
    @IBOutlet weak var favouriteProductTableView: UITableView!
    @IBOutlet weak var mainPageTabbarView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- DELEGATE
        favouriteProductTableView.dataSource = self
        favouriteProductTableView.delegate = self
        
        setupSideMenu()
        
        setupLayouts()
        
        addGestureRecognizer(view: myCartTabbarView)
        addGestureRecognizer(view: profileTabbarView)
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
        case profileTabbarView:
            let vc = self.storyboard?.instantiateViewController(identifier: "ProfileVC") as! ProfileVC
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
        
        myCartTabbarView.layer.cornerRadius = myCartTabbarView.frame.height / 2
        myCartTabbarView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)

        myCartInsideView.layer.cornerRadius = myCartInsideView.frame.height / 2
        myCartInsideView.layer.backgroundColor = UIColor.white.cgColor
        myCartInsideView.backgroundColor = UIColor.white
        myCartInsideView.addShadow(color: .lightGray, opacity: 0.3, radius: 3)
        
        tabbarView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)

        titleLabel.text = "Favorilerim (4 ürün)"
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

extension FavouriteProductsVC: UITableViewDataSource, UITableViewDelegate,  DeleteProductCellDelegate{
    func didDeleteProductButtonPressed(tag: Int) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    @objc func addToCartTapped(_ sender: UITapGestureRecognizer){
//        let vc = self.storyboard?.instantiateViewController(identifier: "AddToCartVC") as! AddToCartVC
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: false, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavouriteProductCell
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (self.addToCartTapped(_:)))
        cell.addtoToCardView.addGestureRecognizer(tapGesture)
        cell.delegate = self
        cell.productNameLabel.text = "Oduncu Gömlek"
        cell.productPriceLabel.text = "76 ₺"
        cell.productColorLabel.text = "Siyah"
        cell.productSizeLabel.text = "M"
        cell.setupLayouts()
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        tableView.reloadData()
    }
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//            return true
//        }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteButton = UITableViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
                return
            }
            deleteButton.backgroundColor = UIColor.clear
            return [deleteButton]
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "BoutiqueProductDetailVC") as! BoutiqueProductDetailVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}

