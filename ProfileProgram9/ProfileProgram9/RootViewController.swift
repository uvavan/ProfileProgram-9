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
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    

}

extension RootViewController: EditProfileDelegate{
    func userDidResetInfo() {
        iblabelName.text = ""
        iblabelLastName.text = ""
    }
    func userDidChange(firstName: String, lastName: String) {
        iblabelName.text = firstName
        iblabelLastName.text = lastName
    }
}

