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
        configureButton(button: sendPasswordButton)
        configurePlaceholderColor(textField: emailTextField)
    }

    func configurePlaceholderColor(textField: UITextField){
        let color = UIColor.white
        let placeholder = textField.placeholder ?? "" //There should be a placeholder set in storyboard or elsewhere string or pass empty
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        textField.backgroundColor = UIColor.clear

    }
    
    func configureButton(button: UIButton){
        button.layer.borderColor = UIColor(red:123/255, green:119/255, blue:115/255, alpha: 1).cgColor
//        button.layer.opacity = 0.5
        button.layer.borderWidth = 5
        button.backgroundColor = UIColor.clear

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
