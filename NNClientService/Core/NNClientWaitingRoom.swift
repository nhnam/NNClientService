//
//  NNClientWaitingRoom.swift
//  NNClientService
//
//  Created by Nguyen Hoang Nam on 26/1/16.
//  Copyright © 2016 Nguyen Hoang Nam. All rights reserved.
//

import UIKit

class NNClientWaitingRoom:NSObject {

    class var sharedInstance:NNClientWaitingRoom {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: NNClientWaitingRoom? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = NNClientWaitingRoom()
        }
        return Static.instance!
    }
    
    private override init() {
        debugPrint("Init NNClientWaitingRoom sharedInstance")
    }
    
    deinit {
        
    }
    
    func seatAndWait(path:String, params:[String: AnyObject]!) -> Void {
        
    }
    
    func getDataAndGoOut(path:String, params:[String: AnyObject]!, data:AnyObject!) ->Void {
        
    }
}
