//
//  NotificationSettingsVC.swift
//  ZarifYol
//
//  Created by Nazik on 31.01.2021.
//

import UIKit

class NotificationSettingsVC: UIViewController {

    @IBOutlet weak var notificationSettingsTableView: UITableView!
    
    var notificationSettingArray = ["E-Mail", "SMS", "Bildirim"]
    
    var notificaationSettingRuleArray = ["İlgimi çekebilecek kampanyalarla ve butik bültenleriyle ilgili e-mail almak istiyorum.", "İlgimi çekebilecek kampanyalar için sms almak istiyorum.", "Gelen bildirimlerim için olan ayarlarımın açık olmasını istiyorum."]
    
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
        return notificationSettingArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationSettingsCell
        cell.configureLayouts()
        cell.notificationSettingCellLabel.text = notificationSettingArray[indexPath.row]
        cell.notificaationSettingCellRuleLabel.text = notificaationSettingRuleArray[indexPath.row]
        return cell
    }
    
    
    
    
}
