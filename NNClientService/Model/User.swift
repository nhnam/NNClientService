//
//  User.swift
//  NNClientService
//
//  Created by Nguyen Hoang Nam on 24/1/16.
//  Copyright © 2016 Nguyen Hoang Nam. All rights reserved.
//

import UIKit

class User: NSObject {
    var completed:(Bool -> ())!
    func updateInfo(wait wait:Bool, success successBlock:(Bool -> ())!) {
        completed = successBlock
        NNClientService.sharedInstance.get(NNApiItem(code: NNApiType.LOGIN, apiPath: NNApiPath.LOGIN_PATH.rawValue), ncs: self);
    }
}

extension User:NNClientServiceProtocol {
    func ncs_ServiceBeginRequest() {
        
    }
    
    func ncs_ServiceCompletedRequest() {
        
    }
    
    func ncs_ServiceSuccessWithData(object: AnyObject?) {
        completed?(true)
    }
    
    func ncs_ServiceFailWithError(error: NSError?) {
        completed?(false)
    }
}
