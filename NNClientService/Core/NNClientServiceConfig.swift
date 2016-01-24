//
//  NNClientServiceConfig.swift
//  NNClientService
//
//  Created by Nguyen Hoang Nam on 24/1/16.
//  Copyright © 2016 Nguyen Hoang Nam. All rights reserved.
//

import UIKit


enum NNApiType:Int{
    case LOGIN
    case LOGOUT
}

enum NNApiPath:String{
    case LOGIN_PATH = "login"
    case LOGOUT_PATH = "logout"
    case NONE = ""
}

struct NNApiItem {
    var code:NNApiType
    var apiPath:String
}

class NNClientServiceConfig: NSObject {

    
    
}
