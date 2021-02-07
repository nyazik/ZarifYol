//
//  OrderDetailVC.swift
//  ZarifYol
//
//  Created by Nazik on 1.02.2021.
//

import UIKit

class OrderDetailVC: UIViewController {
    
    @IBOutlet weak var orderDetailTableView: UITableView!
    @IBOutlet weak var orderNumberLabel: UILabel!
    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var orderSummaryLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderDetailTableView.dataSource = self
        orderDetailTableView.delegate = self
        
        orderNumberLabel.text = "48483848"
        orderDateLabel.text = "48483848"
        orderSummaryLabel.text = "4 Teslimat, 4 Ürün"
        totalPriceLabel.text = "353.45 ₺"
    }
    

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension OrderDetailVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    @objc func rateProduct(_ sender: UITapGestureRecognizer){
        let vc = self.storyboard?.instantiateViewController(identifier: "RateProductVC") as! RateProductVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderDetailCell
        cell.estimatedDeliveryDateLabel.text = "26 Ocak- 1 Şubat"
        cell.deliveryNumberLabel.text = "25022020"
        cell.deliveryStatusLabel.text = "Teslim Edildi"
        cell.priceLabel.text = "90,50₺"
        cell.productDescriptionLabel.text = "KARAKOÇ GİYİM Moleskin Seatle Gömlek"
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (self.rateProduct(_:)))
            cell.evaluateView.addGestureRecognizer(tapGesture)
        cell.configureLayouts()
        return cell
    }
    
    
}
