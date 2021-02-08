//
//  NotificationVC.swift
//  ZarifYol
//
//  Created by Nazik on 30.01.2021.
//

import UIKit

class NotificationVC: UIViewController {
    
    @IBOutlet weak var notificationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:- DELEGATE
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension NotificationVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationCell
        cell.notificationBodyLabel.text = "Sepetindeki ürünler indirimde!"
        cell.notificationDateLabel.text = "2 saat önce"
        return cell
    }
    
    
}
