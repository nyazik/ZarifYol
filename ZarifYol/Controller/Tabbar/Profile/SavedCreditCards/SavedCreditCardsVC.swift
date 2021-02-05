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
        savesCreditCardTableView.dataSource = self
        savesCreditCardTableView.delegate = self
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension SavedCreditCardsVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    @objc func editCreditCart(_ sender: UITapGestureRecognizer){
//        print("tapped")
        let vc = self.storyboard?.instantiateViewController(identifier: "AddAndEditCreditCardVC") as! AddAndEditCreditCardVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SavedCreditCardCell
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (self.editCreditCart(_:)))
            cell.editCreditCartView.addGestureRecognizer(tapGesture)
        cell.setupLayouts()
        return cell
    }
    
    
}
