//
//  SavedCreditCardsVC.swift
//  ZarifYol
//
//  Created by Nazik on 31.01.2021.
//

import UIKit

class SavedCreditCardsVC: UIViewController {
    
    @IBOutlet weak var savesCreditCardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- DELEGATE
        savesCreditCardTableView.dataSource = self
        savesCreditCardTableView.delegate = self

    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addCreditCartButtonPRessed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "AddAndEditCreditCardVC") as! AddAndEditCreditCardVC
        vc.addCard = true
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}

extension SavedCreditCardsVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    @objc func editCreditCart(_ sender: UITapGestureRecognizer){
        let vc = self.storyboard?.instantiateViewController(identifier: "AddAndEditCreditCardVC") as! AddAndEditCreditCardVC
        vc.addCard = false
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SavedCreditCardCell
        cell.bankNameLabel.text = "İş Bankası Kartım- 1607"
        cell.numberOfCreditCardLabel.text = "1111111111******1111"
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (self.editCreditCart(_:)))
            cell.editCreditCardView.addGestureRecognizer(tapGesture)
        cell.setupLayouts()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "AddAndEditCreditCardVC") as! AddAndEditCreditCardVC
        vc.addCard = false
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}
