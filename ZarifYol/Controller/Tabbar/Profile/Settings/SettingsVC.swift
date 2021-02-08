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
        
        //MARK:- GESTURE RECOGNIZER
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
    
    func setupLayouts() {
        
        changePasswordCellView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)
        changePasswordCellView.layer.cornerRadius = 10
        changePasswordCellView.layer.backgroundColor = UIColor.white.cgColor
        
        notificationSettingsCellView.layer.cornerRadius = 10
        notificationSettingsCellView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)
        notificationSettingsCellView.layer.backgroundColor = UIColor.white.cgColor
        
        signOutCellView.layer.cornerRadius = 10
        signOutCellView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)
        signOutCellView.layer.backgroundColor = UIColor.white.cgColor
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}



