//
//  PersonalInformationVC.swift
//  ZarifYol
//
//  Created by Nazik on 5.02.2021.
//

import UIKit
import MaterialComponents

class PersonalInformationVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var nameSurnameTextField: MDCTextField!
    @IBOutlet weak var phoneNumberTextField: MDCTextField!
    @IBOutlet weak var emailTextField: MDCTextField!
    @IBOutlet weak var genderTextField: MDCTextField!
    @IBOutlet weak var dateOfBirthTextField: MDCTextField!
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    var nameSurnameController: MDCTextInputControllerOutlined?
    var phoneNumberController: MDCTextInputControllerOutlined?
    var emailController: MDCTextInputControllerOutlined?
    var genderController: MDCTextInputControllerOutlined?
    var dateOfBirthoController: MDCTextInputControllerOutlined?
    
    
    var textFields: [UITextField] {
        return [nameSurnameTextField, phoneNumberTextField, emailTextField, genderTextField, dateOfBirthTextField]
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
        nameSurnameController = MDCTextInputControllerOutlined(textInput: nameSurnameTextField)
        configureTextView(container: nameSurnameController)
        
        phoneNumberController = MDCTextInputControllerOutlined(textInput: phoneNumberTextField)
        configureTextView(container: phoneNumberController)
        
        emailController = MDCTextInputControllerOutlined(textInput: emailTextField)
        configureTextView(container: emailController)
        
        genderController = MDCTextInputControllerOutlined(textInput: genderTextField)
        configureTextView(container: genderController)
        
        dateOfBirthoController = MDCTextInputControllerOutlined(textInput: dateOfBirthTextField)
        configureTextView(container: dateOfBirthoController)
        
        configureRoundView(view: roundView)
        configureRoundView(view: profileImageView)
        
        saveButton.roundCorners(corners: [.topLeft, .topRight], radius: saveButton.frame.height / 2)
    
        
        
    }
    func configureRoundView(view: UIView){
        view.layer.cornerRadius = view.frame.height / 2
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
    
    
    @IBAction func changeProfilePhotoButtonPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            let imagePicker = UIImagePickerController()
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = true
                present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    @objc func goToCameraRoll(_ sender: UITapGestureRecognizer) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            let imagePicker = UIImagePickerController()
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = true
                present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            profileImageView.image = image
        }
        
    }
    
}


extension PersonalInformationVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let selectedTextFieldIndex = textFields.firstIndex(of: textField), selectedTextFieldIndex < textFields.count - 1 {
            textFields[selectedTextFieldIndex + 1].becomeFirstResponder()
        } else {
            textField.resignFirstResponder() // last textfield, dismiss keyboard directly
        }
        return true
    }
}

