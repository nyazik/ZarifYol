//
//  AddToCartVC.swift
//  ZarifYol
//
//  Created by Nazik on 30.01.2021.
//

import UIKit
import GMStepper

class AddToCartVC: UIViewController {
    
    @IBOutlet weak var saleCodeTextField: UITextField!
    @IBOutlet weak var saleButton: UIButton!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView.dataSource = self
        cartTableView.delegate = self
        setupLayouts()
    }
    func setupLayouts(){
        configureShadow(view: priceView)
        payButton.roundCorners(corners: [.topLeft, .topRight], radius: payButton.frame.height / 2)
        configureShadow(view: bottomView)
        configureCornerRadius(view: saleButton)
        configureCornerRadius(view: saleCodeTextField)
        saleCodeTextField.setRightPaddingPoints(10)
        saleCodeTextField.setLeftPaddingPoints(10)
    }
    
    func configureCornerRadius(view: UIView){
        view.layer.cornerRadius = 10
    }
    func configureShadow(view: UIView){
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmCartButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "PayForOrderVC") as! PayForOrderVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}

extension AddToCartVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartCell
        cell.configureLayouts()
        return cell
    }
    
     
}
