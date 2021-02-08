//
//  ForgotPasswordVC.swift
//  ZarifYol
//
//  Created by Nazik on 28.01.2021.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sendPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setupLayouts()
    }

    func setupLayouts() {
        sendPasswordButton.layer.borderColor = UIColor(red:123/255, green:119/255, blue:115/255, alpha: 1).cgColor
        sendPasswordButton.layer.borderWidth = 5
        sendPasswordButton.backgroundColor = UIColor.clear
        
        configurePlaceholderColor(textField: emailTextField)
    }

    func configurePlaceholderColor(textField: UITextField) {
        let color = UIColor.white
        let placeholder = textField.placeholder ?? ""
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        textField.backgroundColor = UIColor.clear
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "MainPageVC") as! MainPageVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)

    }
    
}
