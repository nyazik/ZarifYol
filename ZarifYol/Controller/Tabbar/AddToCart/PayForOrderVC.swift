//
//  PayForOrderVC.swift
//  ZarifYol
//
//  Created by Nazik on 2.02.2021.
//

import UIKit

class PayForOrderVC: UIViewController {

    @IBOutlet weak var agreementButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var deliveryAddressBorderView: UIView!
    @IBOutlet weak var creditCardView: UIView!
    @IBOutlet weak var creditCardBorderView: UIView!
    @IBOutlet weak var creditOptionsView: UIView!
    @IBOutlet weak var approveAndPayButton: UIButton!
    @IBOutlet weak var deliveryAddressView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    func setupLayouts(){
        configureView(view: deliveryAddressView)
        configureBorderView(view: deliveryAddressBorderView)
        configureView(view: creditCardView)
        configureBorderView(view: creditCardBorderView)
        configureView(view: creditOptionsView)
        configureButton(button: approveAndPayButton)
        configureShadow(view: bottomView)
        agreementButton.titleLabel?.adjustsFontSizeToFitWidth = true;

    }
    
    func configureButton(button: UIButton){
        button.roundCorners(corners: [.topLeft, .topRight], radius: button.frame.height / 2)
        
    }
    
    func configureBorderView(view: UIView){
        view.layer.borderColor = UIColor.yellow.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = UIColor.white
        view.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
    }
    
    func configureShadow(view: UIView){
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
    }
    
    
    func configureView(view: UIView){
        view.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
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
    
    @IBAction func confirmANdPayButtonPressed(_ sender: UIButton) {
        let vc = PaymentSuccessfulVC(nibName: "PaymentSuccessfulVC", bundle: nil)
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false, completion: nil)
    }
    
    
    
}
