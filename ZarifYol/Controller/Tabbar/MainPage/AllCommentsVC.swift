//
//  AllCommentsVCVC.swift
//  ZarifYol
//
//  Created by Nazik on 1.02.2021.
//

import UIKit

class AllCommentsVC: UIViewController {

    @IBOutlet weak var addToCartButton: UIButton!
    
    @IBOutlet weak var allCommentsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allCommentsTableView.dataSource  = self
        allCommentsTableView.delegate = self
        setupLayouts()
    }
    
    func setupLayouts(){

        configureCornerRadiusButton(button: addToCartButton)
    }
    
    
    func configureCornerRadiusButton(button: UIButton){
        button.roundCorners(corners: [.topLeft, .topRight], radius: button.frame.height / 2)
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}



extension AllCommentsVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!AllCommentsCell
        return cell
    }
    
    
    
}
