//
//  NNClientServiceProtocol.swift
//  NNClientService
//
//  Created by Nguyen Hoang Nam on 24/1/16.
//  Copyright © 2016 Nguyen Hoang Nam. All rights reserved.
//

import UIKit

protocol NNClientServiceProtocol: NSObjectProtocol {
    
    func ncs_ServiceSuccessWithData(object:AnyObject?)
    func ncs_ServiceFailWithError(error:NSError?)
    func ncs_ServiceBeginRequest()
    func ncs_ServiceCompletedRequest()
    
}
