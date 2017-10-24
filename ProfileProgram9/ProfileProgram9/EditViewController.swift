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
    @IBOutlet private weak var ibSwitchUser: UISwitch!
    @IBOutlet private weak var ibLabelHello: UILabel!
    var name: String = ""
    var lastName: String = ""
    var ageMore50: Bool = true
    
    var delegate: EditProfileDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ibTextName.delegate = self
        ibTextLastName.delegate = self
        if !name.isEmpty || !lastName.isEmpty {
            ibTextName.text = name
            ibTextLastName.text = lastName
            updateLabelHello()
            ibSwitchUser.isOn = ageMore50
        }
    }
    
    private func updateLabelHello() {
        if ibSwitchUser.isOn {
            ibLabelHello.text = "Здравствуйте, \(name) \(lastName)"
        } else {
            ibLabelHello.text = "Привет, \(name)"
        }
        ibLabelHello.isHidden = false
    }
    
    @IBAction private func ibButtonOkPress(_ sender: Any) {
        view.endEditing(true)
        delegate?.userDidChange(firstName: name, lastName: lastName, ageMore50: ibSwitchUser.isOn)
        updateLabelHello()
    }
    
    @IBAction private func ibButtonResetPress(_ sender: Any) {
        view.endEditing(true)
        delegate?.userDidResetInfo()
        ibTextName.text = ""
        ibTextLastName.text = ""
        ibLabelHello.isHidden = true
        ibSwitchUser.isOn = true
    }
    
    @IBAction private func ibSwitchChanged(_ sender: Any) {
        updateLabelHello()
    }
    
}

extension EditViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField === ibTextName{
            name = textField.text ?? "Undefined"
        } else if textField === ibTextLastName {
            lastName = textField.text ?? "Undefined"
        }
    }
}




