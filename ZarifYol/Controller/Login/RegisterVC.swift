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
        configureButton(button: saveButton)
        configurePlaceholderColor(textField: nameSurnameTextField)
        configurePlaceholderColor(textField: phoneNumberTextField)
        configurePlaceholderColor(textField: emailTextField)
        configurePlaceholderColor(textField: passwordTextField)
        configurePlaceholderColor(textField: passwordRepeatTextField)
        congigureBlurView(view: backgroundView)
    }
    
    
    func congigureBlurView(view: UIView){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterial)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundView.addSubview(blurEffectView)
    }
    
    func configurePlaceholderColor(textField: UITextField){
        let color = UIColor.white
        let placeholder = textField.placeholder ?? ""
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        textField.backgroundColor = UIColor.clear
        
    }
    
    func configureButton(button: UIButton){
        button.layer.borderColor = UIColor(red:123/255, green:119/255, blue:115/255, alpha: 1).cgColor
        button.layer.borderWidth = 5
        button.backgroundColor = UIColor.clear
    }
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
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


