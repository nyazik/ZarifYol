//
//  RateProductVC.swift
//  ZarifYol
//
//  Created by Nazik on 31.01.2021.
//

import UIKit
import Cosmos

class RateProductVC: UIViewController {
    
    @IBOutlet weak var userAgreementButton: UIButton!
    @IBOutlet weak var showNameUnderCommentsButton: UIButton!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productBrandLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var rateProductCosmosView: CosmosView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        commentTextView.delegate = self
        hideKeyboardWhenTappedAround()
        productBrandLabel.text =  "KARAKOÇ GİYİM"
        productDescriptionLabel.text = "Moleskin Seatle Gömlek"
        productPriceLabel.text = "90,50₺"
        
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
    
    @IBAction func showNameUnderCommentsButtonButtonPressed(_ sender: UIButton) {
        if showNameUnderCommentsButton.isSelected {
            showNameUnderCommentsButton.isSelected = false
        }
        else {
            showNameUnderCommentsButton.isSelected = true
        }
    }
    
    @IBAction func userAgreementButtonButtonPressed(_ sender: UIButton) {
        if userAgreementButton.isSelected {
            userAgreementButton.isSelected = false
        }
        else {
            userAgreementButton.isSelected = true
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendCommentAndRateButtonPressed(_ sender: UIButton) {
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

