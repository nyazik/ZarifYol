//
//  OrderDetailVC.swift
//  ZarifYol
//
//  Created by Nazik on 1.02.2021.
//

import UIKit

class OrderDetailVC: UIViewController {
    
    
    @IBOutlet weak var orderDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderDetailTableView.dataSource = self
        orderDetailTableView.delegate = self
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (self.rateProduct(_:)))
            cell.evaluateView.addGestureRecognizer(tapGesture)
        cell.configureLayouts()
        return cell
    }
    
    
}
