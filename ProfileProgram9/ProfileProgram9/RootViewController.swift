//
//  ViewController.swift
//  ProfileProgram9
//
//  Created by Admin on 24.10.2017.
//  Copyright © 2017 Vitaliy. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet private weak var iblabelName: UILabel!
    @IBOutlet private weak var iblabelLastName: UILabel!
    private var ageMore50: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editProfile", let destVC = segue.destination as? EditViewController {
            destVC.delegate = self
            destVC.ageMore50 = self.ageMore50
            if let name = iblabelName.text {
                destVC.name = name
            }
            if let lastName = iblabelLastName.text {
                destVC.lastName = lastName
            }
        }
    }
    
}

extension RootViewController: EditProfileDelegate{
    func userDidResetInfo() {
        iblabelName.text = ""
        iblabelLastName.text = ""
    }
    func userDidChange(firstName: String, lastName: String, ageMore50: Bool) {
        iblabelName.text = firstName
        iblabelLastName.text = lastName
        self.ageMore50 = ageMore50
    }
}

