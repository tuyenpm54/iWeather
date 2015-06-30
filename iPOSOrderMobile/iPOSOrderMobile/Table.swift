//
//  Table.swift
//  iPOS_Order
//
//  Created by iPOS on 4/20/15.
//  Copyright (c) 2015 iPOS. All rights reserved.
//

import Foundation

class Table {
    var AreaId: String = ""
    var TableId: String = ""
    var TableName: String = ""
    var Active: Bool = false
    var Amount: String = ""
    var IsBooking: Bool = false
    var TimeBooking: String = ""
    
    init(areaId: String, tableId: String, tableName: String, active: Bool, amount: String, isBooking: Bool, timeBooking: String) {
        
        AreaId = areaId
        TableId = tableId
        TableName = tableName
        Active = active
        Amount = amount
        IsBooking  = isBooking
        TimeBooking = timeBooking
    }
}