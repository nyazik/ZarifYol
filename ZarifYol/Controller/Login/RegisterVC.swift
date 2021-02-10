//
//  ViewController.swift
//  ZarifYol
//
//  Created by Nazik on 27.01.2021.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var nameSurnameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordRepeatTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var textFields: [UITextField] {
        return [nameSurnameTextField, phoneNumberTextField, emailTextField, passwordTextField, passwordRepeatTextField]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        hideKeyboardWhenTappedAround()
        textFields.forEach {$0.delegate = self}
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addKeyboardObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardObserver()
    }
    
    func setupLayouts() {
        saveButton.layer.borderColor = UIColor(red:123/255, green:119/255, blue:115/255, alpha: 1).cgColor
        saveButton.layer.borderWidth = 5
        saveButton.backgroundColor = UIColor.clear
        
        nameSurnameTextField.layer.backgroundColor = UIColor.clear.cgColor
        phoneNumberTextField.layer.backgroundColor = UIColor.clear.cgColor
        emailTextField.layer.backgroundColor = UIColor.clear.cgColor
        passwordTextField.layer.backgroundColor = UIColor.clear.cgColor
        passwordRepeatTextField.layer.backgroundColor = UIColor.clear.cgColor
    }
    
//    func congigureBlurView(view: UIView) {
//        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterial)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        backgroundView.addSubview(blurEffectView)
//    }
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "MainPageVC") as! MainPageVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}

extension RegisterVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let selectedTextFieldIndex = textFields.firstIndex(of: textField), selectedTextFieldIndex < textFields.count - 1 {
            textFields[selectedTextFieldIndex + 1].becomeFirstResponder()
        } else {
            textField.resignFirstResponder() // last textfield, dismiss keyboard directly
        }
        return true
    }
}


