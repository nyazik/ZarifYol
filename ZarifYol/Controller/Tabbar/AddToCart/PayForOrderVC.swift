//
//  PayForOrderVC.swift
//  ZarifYol
//
//  Created by Nazik on 2.02.2021.
//

import UIKit

class PayForOrderVC: UIViewController {

    @IBOutlet weak var addressInfoLabel: UILabel!
    @IBOutlet weak var sendInvoiceToSameAddressAsProduct: UIButton!
    @IBOutlet weak var agreementButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var deliveryAddressBorderView: UIView!
    @IBOutlet weak var creditCardView: UIView!
    @IBOutlet weak var creditCardBorderView: UIView!
    @IBOutlet weak var creditOptionsView: UIView!
    @IBOutlet weak var approveAndPayButton: UIButton!
    @IBOutlet weak var deliveryAddressView: UIView!
    @IBOutlet weak var oneTimePaymentButton: UIButton!
    @IBOutlet weak var credirCardInfoLabel: UILabel!
    @IBOutlet weak var totalPaymentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    func setupLayouts() {
        configureBorderView(view: deliveryAddressBorderView)
        deliveryAddressBorderView.roundCorners(corners: [.topRight, .bottomRight], radius: 15)

        configureBorderView(view: creditCardBorderView)
        creditCardBorderView.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        
        creditCardView.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        creditCardView.layer.backgroundColor = UIColor.white.cgColor
        
        deliveryAddressView.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        deliveryAddressView.layer.backgroundColor = UIColor.white.cgColor
        
        creditOptionsView.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        creditOptionsView.layer.backgroundColor = UIColor.white.cgColor
        
        approveAndPayButton.roundCorners(corners: [.topLeft, .topRight], radius: approveAndPayButton.frame.height / 2)
        bottomView.addShadow(color: .lightGray, opacity: 0.5, radius: 5)
        bottomView.backgroundColor = UIColor.white

        agreementButton.titleLabel?.adjustsFontSizeToFitWidth = true;
        totalPaymentLabel.text = "150₺"
    }
   
    func configureBorderView(view: UIView) {
        view.layer.borderColor = UIColor.orange.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = UIColor.white
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func agreementButtonPressed(_ sender: UIButton) {
        if agreementButton.isSelected {
            agreementButton.isSelected = false
        }
        else {
            agreementButton.isSelected = true
        }
    }
    
    @IBAction func addOrEditDestinationAddressButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "MyAddressesVC") as! MyAddressesVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func payWithAnotherCreditCardButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SavedCreditCardsVC") as! SavedCreditCardsVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func confirmAndPayButtonPressed (_ sender: UIButton) {
        let vc = PaymentSuccessfulVC(nibName: "PaymentSuccessfulVC", bundle: nil)
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func checkmarkButtonPressed(_ sender: UIButton) {
        if sendInvoiceToSameAddressAsProduct.isSelected {
            sendInvoiceToSameAddressAsProduct.isSelected = false
        }
        else {
            sendInvoiceToSameAddressAsProduct.isSelected = true
        }
    }
    
    @IBAction func oneTimePaymentButtonPressed(_ sender: UIButton) {
        if oneTimePaymentButton.isSelected {
            oneTimePaymentButton.isSelected = false
        }
        else {
            oneTimePaymentButton.isSelected = true
        }
    }
    
    
}
