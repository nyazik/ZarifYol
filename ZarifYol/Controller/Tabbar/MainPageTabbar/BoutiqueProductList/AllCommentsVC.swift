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
    @IBOutlet weak var generalPointLabel: UILabel!
    @IBOutlet weak var quantityOfPoints: UILabel!
    @IBOutlet weak var quantityOfComments: UILabel!
    @IBOutlet weak var quantityOfFivePoints: UILabel!
    @IBOutlet weak var quantityOfFourPoints: UILabel!
    @IBOutlet weak var quantityOfThreePoints: UILabel!
    @IBOutlet weak var quantityOfTwoPoints: UILabel!
    @IBOutlet weak var quantityOfOnePoints: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allCommentsTableView.dataSource  = self
        allCommentsTableView.delegate = self
        setupLayouts()
    }
    
    func setupLayouts(){
        addToCartButton.roundCorners(corners: [.topLeft, .topRight], radius: addToCartButton.frame.height / 2)
        generalPointLabel.text = "3.9"
        quantityOfPoints.text = "2343 puan"
        quantityOfComments.text = "2343 yorum"
        quantityOfFivePoints.text = "2345"
        quantityOfFourPoints.text = "2345"
        quantityOfThreePoints.text = "2345"
        quantityOfTwoPoints.text = "2345"
        quantityOfOnePoints.text = "2345"
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addToCartButtonPressed(_ sender: UIButton) {
        
    }
    
}



extension AllCommentsVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!AllCommentsCell
        cell.rateProductCosmosView.rating = 3
        cell.nameSurnameLabel.text = "Ayşe Altundal"
        cell.commentDateLabel.text = "31.07.2020 / 13:33"
        cell.commentBodyLabel.text = "Erkek arkadaşım için aldığım bu gömleği çok severek giyiyor. Fiyatını  hakeden bir gömlek."
        return cell
    }
    
    
    
}
