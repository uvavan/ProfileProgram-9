//
//  ViewController.swift
//  ProfileProgram9
//
//  Created by Admin on 24.10.2017.
//  Copyright © 2017 Vitaliy. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet private weak var ibLabelName: UILabel!
    @IBOutlet private weak var ibLabelLastName: UILabel!
    private var ageMore50: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editProfile", let destVC = segue.destination as? EditViewController {
            destVC.delegate = self
            destVC.ageMore50 = self.ageMore50
            //destVC
            if let name = ibLabelName.text {
                destVC.name = name
            }
            if let lastName = ibLabelLastName.text {
                destVC.lastName = lastName
            }
        }
    }
    
}

extension RootViewController: EditProfileDelegate{
    func userDidResetInfo() {
        ibLabelName.text = ""
        ibLabelLastName.text = ""
    }
    func userDidChange(firstName: String, lastName: String, ageMore50: Bool) {
        ibLabelName.text = firstName
        ibLabelLastName.text = lastName
        self.ageMore50 = ageMore50
    }
}

