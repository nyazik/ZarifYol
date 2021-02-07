//
//  SignOutVC.swift
//  ZarifYol
//
//  Created by Nazik on 2.02.2021.
//

import UIKit

class SignOutVC: UIViewController {

    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var cellView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayouts()
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.quitPopup(_:)))
//        backgroundView.addGestureRecognizer(tap)
    }

//    @objc func quitPopup(_ sender: UITapGestureRecognizer) {
//        dismiss(animated: false, completion: nil)
//    }
    

    func configureLayouts(){
        configureView(view: cellView)

        cancelButton.roundCorners(corners: [.topRight], radius: 10)
        signOutButton.roundCorners(corners: [.topLeft], radius: 10)

    }
    
  
    
    func configureView(view: UIView){
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func signOutButtonPressed(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
}
