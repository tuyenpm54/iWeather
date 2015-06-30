//
//  ConfigInfo.swift
//  iPOS_Order
//
//  Created by iPOS on 4/20/15.
//  Copyright (c) 2015 iPOS. All rights reserved.
//

import Foundation

class ConfigInfo {
    var ConfigId: String = ""
    var ConfigValue: String = ""
    
    init( id: String, value: String) {
        ConfigId = id
        ConfigValue = value
    }
}