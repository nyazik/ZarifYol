//
//  MyAddressesVC.swift
//  ZarifYol
//
//  Created by Nazik on 31.01.2021.
//

import UIKit

class MyAddressesVC: UIViewController {

    @IBOutlet weak var addressesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addressesTableView.dataSource = self
        addressesTableView.delegate = self
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension MyAddressesVC: UITableViewDataSource, UITableViewDelegate{
    
    @objc func seeLocation(_ sender: UITapGestureRecognizer){
        let vc = self.storyboard?.instantiateViewController(identifier: "EditAddressVC") as! EditAddressVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!AddressesCell
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (self.seeLocation(_:)))
            cell.editAddressView.addGestureRecognizer(tapGesture)
        cell.setupLayouts()
        return cell
    }
    
 
    
}
