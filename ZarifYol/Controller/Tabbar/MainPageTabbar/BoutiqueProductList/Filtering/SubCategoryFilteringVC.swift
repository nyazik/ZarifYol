//
//  SubCategoryVC.swift
//  ZarifYol
//
//  Created by Nazik on 29.01.2021.
//

import UIKit

class SubCategoryFilteringVC: UIViewController {
    
    @IBOutlet weak var subCategoryFilteringTableView: UITableView!
    @IBOutlet weak var applyFiltersButton: UIButton!
    @IBOutlet weak var searchFilterSearchBar: UISearchBar!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:- DELEGATE
        subCategoryFilteringTableView.dataSource = self
        subCategoryFilteringTableView.delegate = self
        
        applyFiltersButton.roundCorners(corners: [.topLeft, .topRight], radius: applyFiltersButton.frame.height / 2)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clearFiltersButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func applyFiltersButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    
}

extension SubCategoryFilteringVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SubCategoryFilteringCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
