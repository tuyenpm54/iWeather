//
//  Scene.swift
//  NumberGame
//
//  Created by iPOS on 3/18/15.
//  Copyright (c) 2015 iPOS. All rights reserved.
//


import UIKit

class Scene: UIViewController {
    //Tạo ra một mảng động chứa các sprite
    
    var grayNumbers = NSMutableArray()
    var colorNumbers = NSMutableArray()

    func addGray(numberGray: NumberGray){
        grayNumbers.addObject(numberGray)
        self.view.addSubview(numberGray)
    }
    
    func removeGray(numberGray: NumberGray) {
        grayNumbers.removeObjectAtIndex(grayNumbers.indexOfObject(numberGray))
        numberGray.removeFromSuperview()
    }
    
    func addColor(numberColor: NumberColor){
        colorNumbers.addObject(numberColor)
        self.view.addSubview(numberColor)
    }
    
    func removeColor(numberColor: NumberColor) {
        colorNumbers.removeObjectAtIndex(colorNumbers.indexOfObject(numberColor))
        numberColor.removeFromSuperview()
    }
    
}