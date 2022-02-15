//
//  AuthUtils.swift
//  Runner
//
//  Created by flm002 on 2021/10/29.
//

import Foundation
import UIKit

@objc class AuthEnum : NSObject{
    @objc static  var  XXQ_Home_Map = 100;
}

@objc class AuthUtils : NSObject{
    @objc static var shared = AuthUtils()
    
    var authList : Array<NSNumber>?
    
    override init() {
        authList = AppUserModel.getUserModel().permissionIds;
    }
    
    @objc static func hasAuth(authId : Int) -> Bool{
        AuthUtils.shared.authList!.contains { (a : NSNumber) -> Bool in
            if NSNumber.init(value: authId) == a{
                return true
            }else{
                return false
            }
        };
    }
    
}
