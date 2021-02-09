//
//  EditAddressVC.swift
//  ZarifYol
//
//  Created by Nazik on 1.02.2021.
//


import UIKit
import MaterialComponents

class EditAddressVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameSurnameTextField: MDCTextField!
    @IBOutlet weak var phoneNumberTextField: MDCTextField!
    @IBOutlet weak var districtTextField: MDCTextField!
    @IBOutlet weak var provinceTextField: MDCTextField!
    @IBOutlet weak var streetNameTextField: MDCTextField!
    @IBOutlet weak var addressTextField: MDCTextField!
    @IBOutlet weak var addressTitleTextField: MDCTextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var addAddress = false
    
    var textFields: [UITextField] {
        return [nameSurnameTextField, phoneNumberTextField, districtTextField, provinceTextField, streetNameTextField, addressTextField, addressTitleTextField]
    }
    
    // MARK: Properties
    var nameSurnameController: MDCTextInputControllerOutlined?
    var phoneNumberController: MDCTextInputControllerOutlined?
    var districtController: MDCTextInputControllerOutlined?
    var provinceController: MDCTextInputControllerOutlined?
    var streetNameController: MDCTextInputControllerOutlined?
    var addressController: MDCTextInputControllerOutlined?
    var addressTitleController: MDCTextInputControllerOutlined?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayouts()
        hideKeyboardWhenTappedAround()
        
        textFields.forEach {$0.delegate = self}
        
        if addAddress == true {
            titleLabel.text = "Adres Ekle"
        }else{
            titleLabel.text = "Adres Düzenle"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addKeyboardObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardObserver()
    }
    
    func setupLayouts() {
        
        nameSurnameController = MDCTextInputControllerOutlined(textInput: nameSurnameTextField)
        configureTextView(container: nameSurnameController)
        
        phoneNumberController = MDCTextInputControllerOutlined(textInput: phoneNumberTextField)
        configureTextView(container: phoneNumberController)
        
        districtController = MDCTextInputControllerOutlined(textInput: districtTextField)
        configureTextView(container: districtController)
        
        provinceController = MDCTextInputControllerOutlined(textInput: provinceTextField)
        configureTextView(container: provinceController)
        
        streetNameController = MDCTextInputControllerOutlined(textInput: streetNameTextField)
        configureTextView(container: streetNameController)
        
        addressController = MDCTextInputControllerOutlined(textInput: addressTextField)
        configureTextView(container: addressController)
        
        addressTitleController = MDCTextInputControllerOutlined(textInput: addressTitleTextField)
        configureTextView(container: addressTitleController)
        saveButton.roundCorners(corners: [.topLeft, .topRight], radius: saveButton.frame.height / 2)
    }

    func configureTextView(container: MDCTextInputControllerOutlined?) {
        if container == provinceController{
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
        if addAddress == false{
            dismiss(animated: true, completion: nil)
        } else {
            
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}


extension EditAddressVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let selectedTextFieldIndex = textFields.firstIndex(of: textField), selectedTextFieldIndex < textFields.count - 1 {
            textFields[selectedTextFieldIndex + 1].becomeFirstResponder()
        } else {
            textField.resignFirstResponder() // last textfield, dismiss keyboard directly
        }
        return true
    }
}


