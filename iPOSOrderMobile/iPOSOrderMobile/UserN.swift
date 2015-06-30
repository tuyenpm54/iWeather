//
//  UserN.swift
//  iPOS_Order
//
//  Created by iPOS on 4/20/15.
//  Copyright (c) 2015 iPOS. All rights reserved.
//

import Foundation

class UserN{
    var LoginName: String = ""
    var UserName: String = ""
    var Password: String = ""
    
    init(logName: String, usr: String, pass: String) {
        LoginName = logName
        UserName = usr
        Password = pass
    }
}