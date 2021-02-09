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
        signInButton.layer.borderColor = UIColor(red:123/255, green:119/255, blue:115/255, alpha: 1).cgColor
        signInButton.layer.borderWidth = 5
        signInButton.backgroundColor = UIColor.clear
        
        nameSurnameTextField.layer.backgroundColor = UIColor.clear.cgColor
        passwordTextField.layer.backgroundColor = UIColor.clear.cgColor
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


