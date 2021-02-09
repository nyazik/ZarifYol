//
//  MenuVC.swift
//  ZarifYol
//
//  Created by Nazik on 31.01.2021.
//

import UIKit

class MenuVC: UIViewController {
    
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameSurnameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchTapped(_:)))
        roundView.addGestureRecognizer(tap)

    }
    
    @objc func touchTapped(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.dismiss(animated: true) {
            UIApplication.shared.windows.first?.rootViewController = vc
        }
        
    }
    
    func setupLayouts(){
        configureView(view: roundView)
        configureView(view: profileImageView)
    }
    
    func configureView(view: UIView){
        view.layer.cornerRadius = view.frame.height / 2
    }
   
}
