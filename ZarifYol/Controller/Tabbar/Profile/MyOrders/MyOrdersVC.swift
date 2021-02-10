//
//  MyOrdersVC.swift
//  ZarifYol
//
//  Created by Nazik on 1.02.2021.
//

import UIKit


class MyOrdersVC: UIViewController {
    
    @IBOutlet weak var myOrdersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- DELEGATE
        myOrdersTableView.dataSource = self
        myOrdersTableView.delegate = self
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension MyOrdersVC: UITableViewDataSource, UITableViewDelegate, MyOrderCellDelegate {
    
    func didOrderButtonPressed(tag: Int) {
        print(tag)
        let vc = self.storyboard?.instantiateViewController(identifier: "OrderDetailVC") as! OrderDetailVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyOrderCell
        cell.dateOfOrderLabel.text = "28 Kasım 2020"
        cell.priceLabel.text = "350.00 ₺"
        cell.orderStatus.text = "Siparişleriniz Hazırlanıyor…"
        cell.delegate = self
        cell.configureCell()
        return cell
    }
    
}
