//
//  NotificationSettingsVC.swift
//  ZarifYol
//
//  Created by Nazik on 31.01.2021.
//

import UIKit

class NotificationSettingsVC: UIViewController {

    
    @IBOutlet weak var notificationSettingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationSettingsTableView.dataSource = self
        notificationSettingsTableView.delegate = self
        
    }
    

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension NotificationSettingsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationSettingsCell
        cell.configureLayouts()
        return cell
    }
    
    
    
    
}
