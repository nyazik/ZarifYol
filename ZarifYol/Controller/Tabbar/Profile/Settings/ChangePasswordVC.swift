//
//  ChangeAddressVC.swift
//  ZarifYol
//
//  Created by Nazik on 4.02.2021.
//

import UIKit
import MaterialComponents

class ChangePasswordVC: UIViewController {
    
    @IBOutlet weak var currentPasswordTextField: MDCTextField!
    @IBOutlet weak var newPasswordTextField: MDCTextField!
    @IBOutlet weak var newPasswordAgainTextField: MDCTextField!
    @IBOutlet weak var updateButton: UIButton!
    
    
    var currentPasswordController: MDCTextInputControllerOutlined?
    var newPasswordController: MDCTextInputControllerOutlined?
    var newPasswordAgainController: MDCTextInputControllerOutlined?

    var textFields: [UITextField] {
        return [currentPasswordTextField, newPasswordTextField, newPasswordAgainTextField]
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
        currentPasswordController = MDCTextInputControllerOutlined(textInput: currentPasswordTextField)
        configureTextView(container: currentPasswordController)
        
        newPasswordController = MDCTextInputControllerOutlined(textInput: newPasswordTextField)
        configureTextView(container: newPasswordController)
        
        newPasswordAgainController = MDCTextInputControllerOutlined(textInput: newPasswordAgainTextField)
        configureTextView(container: newPasswordAgainController)
        
        updateButton.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10)
    }

    func configureTextView(container: MDCTextInputControllerOutlined?){
        container?.borderRadius = 15
        container?.roundedCorners = [.topRight, .bottomRight]
        container?.borderStrokeColor = UIColor.lightGray
        container?.inlinePlaceholderColor = UIColor.lightGray
        container?.activeColor = UIColor(named: "color_orange")
        container?.floatingPlaceholderActiveColor = UIColor(named: "color_orange")
    }
    
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}


extension ChangePasswordVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let selectedTextFieldIndex = textFields.firstIndex(of: textField), selectedTextFieldIndex < textFields.count - 1 {
            textFields[selectedTextFieldIndex + 1].becomeFirstResponder()
        } else {
            textField.resignFirstResponder() // last textfield, dismiss keyboard directly
        }
        return true
    }
}


