//
//  SeetingsVC.swift
//  ZarifYol
//
//  Created by Nazik on 31.01.2021.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var changePasswordCellView: UIView!
    @IBOutlet weak var notificationSettingsCellView: UIView!
    @IBOutlet weak var signOutCellView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayouts()
        
        addGestureRecognizer(view: notificationSettingsCellView)
        addGestureRecognizer(view: signOutCellView)
        addGestureRecognizer(view: changePasswordCellView)
    
    }

    func addGestureRecognizer(view: UIView) {
        view.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.gestureRecognizerMethods(_:)))
        view.addGestureRecognizer(gesture)
    }
    
    @objc func gestureRecognizerMethods(_ sender: UITapGestureRecognizer) {
        switch sender.view {
        case changePasswordCellView:
            let vc = self.storyboard?.instantiateViewController(identifier: "ChangePasswordVC") as! ChangePasswordVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            print("asdfghjk")
        case notificationSettingsCellView:
            let vc = self.storyboard?.instantiateViewController(identifier: "NotificationSettingsVC") as! NotificationSettingsVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        case signOutCellView:
            let vc = SignOutVC(nibName: "SignOutVC", bundle: nil)
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: false, completion: nil)
        default:
            break
        }
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



