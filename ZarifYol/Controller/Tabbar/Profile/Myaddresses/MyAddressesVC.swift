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
        //MARK:- DELEGATE
        addressesTableView.dataSource = self
        addressesTableView.delegate = self
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addAddressButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "EditAddressVC") as! EditAddressVC
        vc.addAddress = true
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}

extension MyAddressesVC: UITableViewDataSource, UITableViewDelegate {
    
    @objc func editAddress(_ sender: UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(identifier: "EditAddressVC") as! EditAddressVC
        vc.addAddress = false
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!AddressesCell
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (self.editAddress(_:)))
        cell.editAddressView.addGestureRecognizer(tapGesture)
        cell.cityNameLabel.text = "Görükle"
        cell.nameSurnameLabel.text = "Tahir Karakoç"
        cell.phoneNumberLabel.text = "0555 *** *** 55 "
        cell.addressLabel.text = "Dumlupınar mahallesi, dumlupınar cad. No:9/9  Görükle"
        cell.setupLayouts()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
 
    
}
