//
//  ViewController.swift
//  ZarifYol
//
//  Created by Nazik on 27.01.2021.
//

import UIKit

class RegisterVC: UIViewController {

    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameSurnameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordRepeatTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    
    
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
        configurePlaceholderColor(textField: passwordTextField)
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
        let placeholder = textField.placeholder ?? "" //There should be a placeholder set in storyboard or elsewhere string or pass empty
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
    }
    
    func configureButton(button: UIButton){
        button.layer.borderColor = UIColor(red:123/255, green:119/255, blue:115/255, alpha: 1).cgColor
//        button.layer.opacity = 0.5
        button.layer.borderWidth = 5
    }
    
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


