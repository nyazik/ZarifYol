//
//  FilteringCategoryVC.swift
//  ZarifYol
//
//  Created by Nazik on 29.01.2021.
//

import UIKit

class FilteringCategoryVC: UIViewController {

    @IBOutlet weak var filteringCategoryTableView: UITableView!
    @IBOutlet weak var listAllProductsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:- DELEGATE
        filteringCategoryTableView.dataSource = self
        filteringCategoryTableView.delegate = self
        listAllProductsButton.roundCorners(corners: [.topLeft, .topRight], radius: listAllProductsButton.frame.height / 2)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clearFiltersButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func listAllProductsButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension FilteringCategoryVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FilteringCategoryCell
        cell.categoryNameLabel.text = "Fiyat"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SubCategoryVC") as! SubCategoryFilteringVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
