//
//  EditViewController.swift
//  ProfileProgram9
//
//  Created by Admin on 24.10.2017.
//  Copyright © 2017 Vitaliy. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet private weak var ibTextName: UITextField!
    @IBOutlet private weak var ibTextLastName: UITextField!
    @IBOutlet weak var ibSwitchUser: UISwitch!
    @IBOutlet private weak var ibLabelHello: UILabel!
    var name: String = ""
    var lastName: String = ""
    var ageMore50: Bool = true
//    {
//        get {
//            return ibSwitchUser.isOn
//        }
//        set{
//
//        }
//    }
    
    var delegate: EditProfileDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !name.isEmpty || !lastName.isEmpty {
            ibTextName.text = name
            ibTextLastName.text = lastName
            ibSwitchUser.isOn = ageMore50
            updateLabelHello()
        }
    }
    
    private func updateLabelHello() {
        ageMore50 = ibSwitchUser.isOn
        if !name.isEmpty, !lastName.isEmpty {
            if ageMore50 {
                ibLabelHello.text = "Здравствуйте, \(name) \(lastName)"
            } else {
                ibLabelHello.text = "Привет, \(name)"
            }
            ibLabelHello.isHidden = false
        }
    }
    
    @IBAction private func ibButtonOkPress(_ sender: Any) {
        view.endEditing(true)
        name = ibTextName.text ?? "Undefined"
        lastName = ibTextLastName.text ?? "Undefined"
        ageMore50 = ibSwitchUser.isOn
        delegate?.userDidChange(firstName: name, lastName: lastName, ageMore50: ageMore50)
        updateLabelHello()
    }
    
    @IBAction private func ibButtonResetPress(_ sender: Any) {
        view.endEditing(true)
        delegate?.userDidResetInfo()
        ibTextName.text = ""
        ibTextLastName.text = ""
        name = ""
        lastName = ""
        ibLabelHello.isHidden = true
        ageMore50 = true
        ibSwitchUser.isOn = ageMore50
    }
    
    @IBAction private func ibSwitchChanged(_ sender: Any) {
        updateLabelHello()
    }
}

