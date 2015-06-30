//
//  Food.swift
//  iPOS_Order
//
//  Created by iPOS on 4/20/15.
//  Copyright (c) 2015 iPOS. All rights reserved.
//

import Foundation

class Food {
    var ItemId: String = ""
    var ItemName: String = ""
    var ItemTypeId: String = ""
    var ItemPrice: String = ""
    var ItemImage: String = ""
    var ItemDescription: String = ""
    var ItemTax: String = ""
    var TextItemPrice: String = ""
    var IsEatWith: String = ""
    var IsService: String = ""
    var QuantityDefault: String = ""
    var Unit_Id: String = ""
    var Is_Foreign: String = ""
    var Cost_Price: String = ""
    var Is_Kit: String = ""
    var Is_Print_Label: String = ""
    var Price_Change: String = ""
    var Time_Cooking: String = ""
    var isShowDetail: Bool = false
    
    init(id: String, name : String, type: String, price: String, image: String, desciption: String, tax: String, textPrice : String, isEatWith: String, isService: String, quantityDefault: String, unitID: String, isForeign: String, cosPrice: String, isKit: String, isPrintLabel: String, priceChange: String, TimeCooking: String) {
        
        ItemId = id
        ItemName = name
        ItemTypeId = type
        ItemPrice = price
        ItemImage = image
        ItemDescription = desciption
        ItemTax = tax
        TextItemPrice = textPrice
        IsEatWith = isEatWith
        IsService = isService
        QuantityDefault = quantityDefault
        Unit_Id = unitID
        Is_Foreign = isForeign
        Cost_Price = cosPrice
        Is_Kit = isKit
        Is_Print_Label = isPrintLabel
        Price_Change = priceChange
        Time_Cooking = TimeCooking

    }
}