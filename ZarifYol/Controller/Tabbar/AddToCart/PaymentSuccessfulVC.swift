//
//  PaymentSuccessfulVC.swift
//  ZarifYol
//
//  Created by Nazik on 2.02.2021.
//

import UIKit

class PaymentSuccessfulVC: UIViewController {
    
    @IBOutlet weak var closePopupButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var listOfOrdersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:- DELEGATE
        listOfOrdersTableView.dataSource = self
        listOfOrdersTableView.delegate = self
        
        //MARK:- REGISTER NIB
        self.listOfOrdersTableView.register(UINib.init(nibName: "SuccessfulPaymentCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        //MARK:- GESTURE RECOGNIZER
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchTapped(_:)))
        backgroundView.addGestureRecognizer(tap)
        
        closePopupButton.layer.cornerRadius = 15
    }
    
    @objc func touchTapped(_ sender: UITapGestureRecognizer) {
        dismiss(animated: false, completion: nil)
    }
 
    @IBAction func closePopupButtonPressed(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }

}

extension PaymentSuccessfulVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listOfOrdersTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SuccessfulPaymentCell
        return cell
        
    }
    
}
