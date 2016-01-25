//
//  NNClientService.swift
//  NNClientService
//
//  Created by Nguyen Hoang Nam on 24/1/16.
//  Copyright © 2016 Nguyen Hoang Nam. All rights reserved.
//

import UIKit
import Alamofire

enum NNMethod:Int {
    case OPTIONS, GET, HEAD, POST, PUT, PATCH, DELETE, TRACE, CONNECT
}

struct ApiCache {
    var path:String
    var param:[String: AnyObject]!
}

class NNClientService {
    
    var ncsPaths: Array<ApiCache> = []
    
    class var sharedInstance:NNClientService {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: NNClientService? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = NNClientService()
        }
        return Static.instance!
    }
    
    private init() {
        debugPrint("Init NNClientService sharedInstance")
    }
    
    func path(apiItem:NNApiItem, params:[String: AnyObject]? = nil) -> NNApiPath {
        switch apiItem.code {
        case .LOGIN:
            return NNApiPath.LOGIN_PATH
            //break
        case .LOGOUT:
            return NNApiPath.LOGOUT_PATH
            //break
        }
    }
    
    func get(apiItem:NNApiItem, params:[String: AnyObject]? = nil, ncs: NNClientServiceProtocol!) -> Void {
        
        let path:String = self.path(apiItem, params: params).rawValue
        let api:ApiCache = ApiCache(path: path, param: params)
        
        if( self.ncsPaths.count > 5) {
            debugPrint("Max count")
            ncs.ncs_ServiceFailWithError(nil)
            return;
        } else {
            self.ncsPaths.append(api)
        
            debugPrint("\(self.ncsPaths.count)")
            
            ncs?.ncs_ServiceBeginRequest()
            
            Alamofire.request(.GET, path, parameters: params).responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization

                if let JSON = response.result.value {
                    debugPrint("JSON: \(JSON)")
                    ncs.ncs_ServiceSuccessWithData(JSON)
                } else {
                    ncs.ncs_ServiceFailWithError(nil)
                }
                
                ncs?.ncs_ServiceCompletedRequest()
                self.ncsPaths = self.ncsPaths.filter {
                    $0.path != api.path
                }
            }
           
        }
    }
}
