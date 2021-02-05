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
        notificationTableView.dataSource = self
        notificationTableView.delegate = self
    }
    

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
  
}

extension NotificationVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationCell
        return cell
    }
    
    
}
