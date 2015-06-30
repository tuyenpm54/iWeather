//
//  ViewController.swift
//  NumberGame
//
//  Created by iPOS on 3/18/15.
//  Copyright (c) 2015 iPOS. All rights reserved.
//

import UIKit

class ViewController: Scene {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNumbers()
        
    }
    func loadNumbers() {
        var num1Gray = NumberGray(scene: self, image: UIImage(named: "1g.png")!,number: 1)
        var num2Gray = NumberGray(scene: self, image: UIImage(named: "2g.png")!,number: 2)
        var num3Gray = NumberGray(scene: self, image: UIImage(named: "3g.png")!,number: 3)
        var num4Gray = NumberGray(scene: self, image: UIImage(named: "4g.png")!,number: 4)
        self.addGray(num1Gray)
        self.addGray(num2Gray)
        self.addGray(num3Gray)
        self.addGray(num4Gray)
        
        var num1Color = NumberColor(scene: self, image: UIImage(named: "1.png")!,number: 1)
        var num2Color = NumberColor(scene: self, image: UIImage(named: "2.png")!,number: 2)
        var num3Color = NumberColor(scene: self, image: UIImage(named: "3.png")!,number: 3)
        var num4Color = NumberColor(scene: self, image: UIImage(named: "4.png")!,number: 4)
        self.addColor(num1Color)
        self.addColor(num2Color)
        self.addColor(num3Color)
        self.addColor(num4Color)
    }
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if motion == UIEventSubtype.MotionShake {
            
        }
    }
    /*
    4. Viết hàm để kiểm tra:
    - Khoảng cách giữa 2 tâm (center) của hình < D
    - Độ sai khác giữa 2 góc quay của 2 hình < alpha
    */
    func checkNear(viewA: UIView, viewB: UIView)-> Bool {
        return false
    }
    
    //Viết hàm sẽ rải ngẫu nhiên hình (tham số vào 1 UIView)
    func placeRandom(view: UIView){
        
    }
   
}

