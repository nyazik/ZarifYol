//
//  RateProductVC.swift
//  ZarifYol
//
//  Created by Nazik on 31.01.2021.
//

import UIKit

class RateProductVC: UIViewController {
    
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        commentTextView.delegate = self
        hideKeyboardWhenTappedAround()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        addKeyboardObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardObserver()
    }
    
    
    func setupLayouts(){
        configureView(view: priceView)
        commentTextView(textView: commentTextView)
        configureButton(button: sendButton)
        commentTextView.text = "Yorum Yap"
        commentTextView.textColor = UIColor.lightGray
        commentTextView.padding()
    }

    func configureView(view: UIView){
        view.layer.cornerRadius = 15
    }
    
    func commentTextView(textView: UITextView){
        textView.layer.cornerRadius = 15
    }
    
    func configureButton(button: UIButton){
        button.roundCorners(corners: [.topRight, .topLeft], radius:   button.frame.height / 2)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}


extension RateProductVC  : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Çekici Açıklamasını Giriniz"
            textView.textColor = UIColor.lightGray
        }
    }
}

