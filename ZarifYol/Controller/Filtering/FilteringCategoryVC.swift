//
//  FilteringCategoryVC.swift
//  ZarifYol
//
//  Created by Nazik on 29.01.2021.
//

import UIKit

class FilteringCategoryVC: UIViewController {

    @IBOutlet weak var filteringCategoryTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filteringCategoryTableView.dataSource = self
        filteringCategoryTableView.delegate = self
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension FilteringCategoryVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SubCategoryVC") as! SubCategoryFilteringVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
