//
//  LoginVC.swift
//  ZarifYol
//
//  Created by Nazik on 28.01.2021.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var nameSurnameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var textFields: [UITextField] {
        return [nameSurnameTextField, passwordTextField]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        textFields.forEach {$0.delegate = self}
        setupLayouts()
    }
    override func viewWillAppear(_ animated: Bool) {
        addKeyboardObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardObserver()
    }

    func setupLayouts() {
        configureButton(button: signInButton)
        configurePlaceholderColor(textField: nameSurnameTextField)
        configurePlaceholderColor(textField: passwordTextField)
    }
    
    func configurePlaceholderColor(textField: UITextField){
        let color = UIColor.white
        let placeholder = textField.placeholder ?? "" //There should be a placeholder set in storyboard or elsewhere string or pass empty
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
    }
    
    func configureButton(button: UIButton){
        button.layer.borderColor = UIColor(red:123/255, green:119/255, blue:115/255, alpha: 1).cgColor
//        button.layer.opacity = 0.5
        button.layer.borderWidth = 5
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ForgotPasswordVC") as! ForgotPasswordVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "RegisterVC") as! RegisterVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "MainPageVC") as! MainPageVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
}


extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let selectedTextFieldIndex = textFields.firstIndex(of: textField), selectedTextFieldIndex < textFields.count - 1 {
            textFields[selectedTextFieldIndex + 1].becomeFirstResponder()
        } else {
            textField.resignFirstResponder() // last textfield, dismiss keyboard directly
        }
        return true
    }
}


