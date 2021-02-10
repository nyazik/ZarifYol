//
//  AddAndEditCreditCardVC.swift
//  ZarifYol
//
//  Created by Nazik on 5.02.2021.
//

import UIKit
import MaterialComponents
import iOSDropDown

class AddAndEditCreditCardVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var accountNameTextField: MDCTextField!
    @IBOutlet weak var nameOfTheBankTextField: MDCTextField!
    @IBOutlet weak var accountNumberTextField: MDCTextField!
    @IBOutlet weak var expirationDateTextField: MDCTextField!
    @IBOutlet weak var CVCTextField: MDCTextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    var addCard = false
    
    var textFields: [UITextField] {
        return [accountNameTextField, nameOfTheBankTextField, accountNumberTextField, expirationDateTextField, CVCTextField]
        
    }
    
    var accountNameController: MDCTextInputControllerOutlined?
    var nameOfTheBankController: MDCTextInputControllerOutlined?
    var accountNumberController: MDCTextInputControllerOutlined?
    var expirationDateController: MDCTextInputControllerOutlined?
    var CVCController: MDCTextInputControllerOutlined?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayouts()
        
        hideKeyboardWhenTappedAround()
        
        textFields.forEach {$0.delegate = self}
        
        if addCard == true{
            titleLabel.text = "Kart Ekle"
        }else{
            titleLabel.text = "Kart Bilgileri Güncelle"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addKeyboardObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardObserver()
    }
    
    func setupLayouts() {
        
        accountNameController = MDCTextInputControllerOutlined(textInput: accountNameTextField)
        configureTextView(container: accountNameController)
        
        nameOfTheBankController = MDCTextInputControllerOutlined(textInput: nameOfTheBankTextField)
        configureTextView(container: nameOfTheBankController)
        
        accountNumberController = MDCTextInputControllerOutlined(textInput: accountNumberTextField)
        configureTextView(container: accountNumberController)
        
        expirationDateController = MDCTextInputControllerOutlined(textInput: expirationDateTextField)
        configureTextView(container: expirationDateController)
        
        CVCController = MDCTextInputControllerOutlined(textInput: CVCTextField)
        configureTextView(container: CVCController)
        
        saveButton.roundCorners(corners: [.topLeft, .topRight], radius: saveButton.frame.height / 2)
    }
    
    func configureTextView(container: MDCTextInputControllerOutlined?) {
        if container == CVCController {
            container?.borderRadius = 15
            container?.roundedCorners = [.allCorners]
            container?.borderStrokeColor = UIColor.lightGray
            container?.inlinePlaceholderColor = UIColor.lightGray
            container?.activeColor = UIColor(named: "color_orange")
            container?.floatingPlaceholderActiveColor = UIColor(named: "color_orange")
        } else {
            container?.borderRadius = 15
            container?.roundedCorners = [.topRight, .bottomRight]
            container?.borderStrokeColor = UIColor.lightGray
            container?.inlinePlaceholderColor = UIColor.lightGray
            container?.activeColor = UIColor(named: "color_orange")
            container?.floatingPlaceholderActiveColor = UIColor(named: "color_orange")
        }
        
    }

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        if addCard == false{
            dismiss(animated: true, completion: nil)
        }else{
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension AddAndEditCreditCardVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let selectedTextFieldIndex = textFields.firstIndex(of: textField), selectedTextFieldIndex < textFields.count - 1 {
            textFields[selectedTextFieldIndex + 1].becomeFirstResponder()
        } else {
            textField.resignFirstResponder() // last textfield, dismiss keyboard directly
        }
        return true
    }
}

