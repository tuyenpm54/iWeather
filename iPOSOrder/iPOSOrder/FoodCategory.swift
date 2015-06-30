//
//  FoodCategory.swift
//  iPOS_Order
//
//  Created by iPOS on 4/20/15.
//  Copyright (c) 2015 iPOS. All rights reserved.
//

import Foundation

class FoodCategory {
    var ItemTypeId: String = ""
    var ItemTypeName: String = ""
    
    init(id: String, name: String) {
        ItemTypeId = id
        ItemTypeName = name
    }
}