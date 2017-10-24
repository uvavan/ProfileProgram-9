//
//  EditProfileDelegate.swift
//  ProfileProgram9
//
//  Created by Admin on 24.10.2017.
//  Copyright © 2017 Vitaliy. All rights reserved.
//

import UIKit

protocol EditProfileDelegate {
    func  userDidChange(firstName:  String, lastName:  String)
    func  userDidResetInfo()
}
