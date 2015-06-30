//
//  NumberView.swift
//  NumberGame
//
//  Created by iPOS on 3/18/15.
//  Copyright (c) 2015 iPOS. All rights reserved.
//

import UIKit

extension CGFloat {
    var abs: CGFloat {
        return (self < 0) ? -self : self
    }
}

class NumberGray : UIImageView {
    
    var rolateAngle: CGFloat = 0.0
    var number = 0
    var scene: Scene!
    init(scene: Scene, image: UIImage, number : Int) {
        super.init(frame: CGRect(x: 0, y: 0, width: 90, height: 150))
        self.image = image
        self.scene = scene
        self.number = number
        

        var x0 = CGFloat(arc4random_uniform(UInt32(scene.view.bounds.width - self.bounds.width)))
        var y0 = CGFloat(arc4random_uniform(UInt32(scene.view.bounds.height - self.bounds.height)))
        self.frame = CGRect(x: x0, y: y0,width: 90, height: 150)
        
       
        
        self.rolateAngle  = CGFloat(arc4random_uniform(UInt32(180))) * CGFloat(M_PI / 180)
        println("RolateAngle + \(self.rolateAngle )")
        self.transform = CGAffineTransformMakeRotation(rolateAngle)
       
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init()
    }
    
}

class NumberColor : UIImageView {
    
    var rolateAngle: CGFloat = 0.0
    var number = 0
    var scene: Scene!
    init(scene: Scene, image: UIImage, number: Int) {
        super.init(frame: CGRect(x: 0, y: 0, width: 80, height: 140))
        self.image = image
        self.scene = scene
        self.number = number
        self.userInteractionEnabled = true
        self.multipleTouchEnabled = true
        
        var x0 = CGFloat(arc4random_uniform(UInt32(scene.view.bounds.width - self.bounds.width)))
        var y0 = CGFloat(arc4random_uniform(UInt32(scene.view.bounds.height - self.bounds.height)))
        self.frame = CGRect(x: x0, y: y0,width: 80, height: 140)
        
        let pan = UIPanGestureRecognizer(target: self, action: "onPan:")
        self.addGestureRecognizer(pan)
        let rotate = UIRotationGestureRecognizer(target: self, action: "onRotate:")
        self.addGestureRecognizer(rotate)
        
        self.rolateAngle  = CGFloat(arc4random_uniform(UInt32(180))) * CGFloat(M_PI / 180)
        println("RolateAngle + \(self.rolateAngle )")
        self.transform = CGAffineTransformMakeRotation(rolateAngle)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init()
    }
    
    func onPan(pan: UIPanGestureRecognizer) {
        // if (pan.state == UIGestureRecognizerState.Began || pan.state == UIGestureRecognizerState.Changed) {
        pan.view!.center = pan.locationInView(self.scene.view)
        //pan.view có thể thay thế hoàn toàn cho target
        //target!.center = pan.locationInView(self.view)
        //}
        
        for item in self.scene.grayNumbers {
            if(self.checkNear(item as NumberGray)) {
                    self.removeGestureRecognizer(pan)
               
                break
            }
        }
        
        
    }
    
    func checkNear(numgray: NumberGray)->Bool {
        if (self.number != numgray.number) {
            return false
        } else {
            println("centerColor: (\(self.center.x),\(self.center.y))")
            println("centerGray: (\(numgray.center.x),\(numgray.center.y))")
            println("AngleColor: (\(self.rolateAngle))")
            println("AngleGray: (\(numgray.rolateAngle))")
           if ( self.center.x >= (numgray.center.x - 2) &&
                self.center.x <= (numgray.center.x + 2)  &&
                self.center.y >= (numgray.center.y - 2) &&
                self.center.y <= (numgray.center.y + 2) &&
                self.rolateAngle.abs >= (numgray.rolateAngle.abs - 1) &&
                self.rolateAngle.abs <= (numgray.rolateAngle.abs + 1)) {
                  
                    UIView.animateWithDuration(0.1, animations: {
                        self.center = CGPoint(x: numgray.center.x, y: numgray.center.y)
                        self.transform = CGAffineTransformMakeRotation(numgray.rolateAngle)

                    })
                    
                    println("Match!")

                    return true
            }
            
            else {
                return false
            }
            
        }
    }
    
    func onRotate(rotate: UIRotationGestureRecognizer) {
        self.transform = CGAffineTransformMakeRotation(rotate.rotation)
        rolateAngle = getRotateAngle()
        for item in self.scene.grayNumbers {
            if(self.checkNear(item as NumberGray)) {
               
                self.removeGestureRecognizer(rotate)
                
                break
            }
        }

    }
    //http://stackoverflow.com/questions/5754877/get-the-current-angle-rotation-radian-for-a-uiview
    func getRotateAngle() -> CGFloat{
        return CGFloat(atan2f(Float(self.transform.b), Float(self.transform.a)))
    }
}
