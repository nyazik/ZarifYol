//
//  SeetingsVC.swift
//  ZarifYol
//
//  Created by Nazik on 31.01.2021.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var notificationSettingsView: UIView!
    @IBOutlet weak var changePasswordView: UIView!
    @IBOutlet weak var changePasswordCellView: UIView!
    @IBOutlet weak var notificationSettingsCellView: UIView!
    @IBOutlet weak var signOutCellView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchTapped(_:)))
        signOutCellView.addGestureRecognizer(tap)
        
        
        let secondTap = UITapGestureRecognizer(target: self, action: #selector(self.secondTouchTapped(_:)))
        notificationSettingsView.addGestureRecognizer(secondTap)
        
        let thirdTap = UITapGestureRecognizer(target: self, action: #selector(self.thirdTapped(_:)))
        changePasswordView.addGestureRecognizer(thirdTap)
    }
    
   
    
    @objc func touchTapped(_ sender: UITapGestureRecognizer) {
        let vc = SignOutVC(nibName: "SignOutVC", bundle: nil)
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false, completion: nil)
    }
    
   
    @objc func secondTouchTapped(_ sender: UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(identifier: "NotificationSettingsVC") as! NotificationSettingsVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @objc func thirdTapped(_ sender: UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ChangePasswordVC") as! ChangePasswordVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    func setupLayouts(){
        configureRoundCorner(view: changePasswordCellView)
        configureRoundCorner(view: notificationSettingsCellView)
        configureRoundCorner(view: signOutCellView)
        configureShadow(view: changePasswordCellView)
        configureShadow(view: notificationSettingsCellView)
        configureShadow(view: signOutCellView)
    }
    
    func configureRoundCorner(view: UIView){
        view.layer.cornerRadius = 10
        view.layer.backgroundColor = UIColor.white.cgColor
    }
   
    
    func configureShadow(view: UIView){
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}



