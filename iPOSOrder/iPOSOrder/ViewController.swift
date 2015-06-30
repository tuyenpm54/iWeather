//
//  ViewController.swift
//  iPOSOrder
//
//  Created by iPOS on 4/22/15.
//  Copyright (c) 2015 iPOS. All rights reserved.
//

import UIKit
import PKHUD
import Alamofire

class ViewController: UIViewController {
    
    let concurrentQueue : dispatch_queue_t = dispatch_queue_create("ipos.tuyen.pham.LoadingData", DISPATCH_QUEUE_CONCURRENT)
    let group = dispatch_group_create()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
        PKHUD.sharedHUD.show()
        
    }
    
    override func viewDidAppear(animated: Bool) {
      
     
        dispatch_group_notify(group, concurrentQueue, {
             //self.loadingListUser()
             self.loadingListArea()
             //self.loadingListFood()
        })


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    
    func loadingListFood() {
        Alamofire.request(.GET, "\(GlobalVariable.hostURL)/GetItems")
            .responseJSON { (request, response, json, error) in
                if(error != nil) {
                    NSLog("GetFood Error: \(error)")
                }
                else {
                    NSLog("GetFood Success! ")
                    var result = JSON(json!)
                    
                    //                    for (index: String, subJson: JSON) in jsonArray {
                    //
                    //                        var user = UserN()
                    //                        NSLog("User: \(subJson)")
                    //                        user.LoginName = subJson["LoginName"].stringValue
                    //                        user.UserName = subJson["UserName"].stringValue
                    //                        GlobalVariable.listUser.append(user)
                    //                    }
                    
                }
        }

        
    }
    
    func loadingListCombo() {
        
    }
    
    func loadingListUser() {
        Alamofire.request(.GET, "\(GlobalVariable.hostURL)/GetUsers")
            .responseJSON { (request, response, json, error) in
                if(error != nil) {
                    NSLog("GetUser Error: \(error)")
                }
                else {
                    NSLog("GetUser Success! ")
                    var result = JSON(json!)
                    NSLog("\(result) ")
//                    if let data = result["ListUser"].arrayValue as [JSON]?{
//                        NSLog("data \(data) ")
////                        for i in 0..< (data.count) {
////                            var user = UserN()
////                            NSLog("User: \(subJson)")
////                            user.LoginName = subJson["LoginName"].stringValue
////                            user.UserName = subJson["UserName"].stringValue
////                            GlobalVariable.listUser.append(user)
////                        }
//                    } else {
//                         NSLog("GetUser parse error! ")
//                    }

                    
                }
        }
    }
    
    func loadingListArea() {
        Alamofire.request(.GET, "\(GlobalVariable.hostURL)/GetAreas")
            .responseJSON { (request, response, json, error) in
                if(error != nil) {
                    NSLog("GetArea Error: \(error)")
                }
                else {
                    NSLog("GetArea Success! ")
                  
                    var result = JSON(json!)
                    
                    if let haystack = result["ListArea"].string {
                        
                            NSLog("Area: \(haystack)")
                        
                    }
                    NSLog("ListArea : \(result) ")

//                    NSLog("Area: \(json)  \(result)")
//                    var arrayArea = result[0]
//                    NSLog("Array Area: \(arrayArea.isArray)")
                    
                    //                    for (index: String, subJson: JSON) in jsonArray {
                    //
                    //                        var user = UserN()
                    //                        NSLog("User: \(subJson)")
                    //                        user.LoginName = subJson["LoginName"].stringValue
                    //                        user.UserName = subJson["UserName"].stringValue
                    //                        GlobalVariable.listUser.append(user)
                    //                    }
                    
                }
        }
    }

}

