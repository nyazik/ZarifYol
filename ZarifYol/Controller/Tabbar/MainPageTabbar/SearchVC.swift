//
//  SearchVC.swift
//  ZarifYol
//
//  Created by Nazik on 30.01.2021.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchProductSearchBar: UISearchBar!
    @IBOutlet weak var searchCategoryCollectionView: UICollectionView!
    @IBOutlet weak var seachResultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- DELEGATE
        searchCategoryCollectionView.dataSource = self
        searchCategoryCollectionView.delegate = self
        
        seachResultTableView.dataSource = self
        seachResultTableView.delegate = self
        
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PopularSearchResultCell
        cell.popularSearchResultLabel.text = "Parfüm"
        cell.configureLayouts()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 120, height: 40)
    }
    
}

extension SearchVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PreviousSearchResultCell
        cell.previousSearchResultLabel.text = "Parfüm"
        return cell
    }
    
}
