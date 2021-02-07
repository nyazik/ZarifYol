//
//  SubCategoryVC.swift
//  ZarifYol
//
//  Created by Nazik on 29.01.2021.
//

import UIKit

class SubCategoryFilteringVC: UIViewController {
    
    @IBOutlet weak var searchFilterSearchBar: UISearchBar!
    @IBOutlet weak var subCategoryFilteringTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subCategoryFilteringTableView.dataSource = self
        subCategoryFilteringTableView.delegate = self
        
    }
    
   
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension SubCategoryFilteringVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SubCategoryFilteringCell
        return cell
    }
    
    
}
