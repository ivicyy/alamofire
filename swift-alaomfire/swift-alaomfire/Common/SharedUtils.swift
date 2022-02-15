//
// Created by Kayo Xu on 2019/1/16.
// Copyright (c) 2019 smarthome. All rights reserved.
//

import UIKit

@objc class SharedUtils: NSObject {
    
    static let shared_login_info = "flutter._shared_login_info"
    
    @objc static func getLoginInfo() -> String {
        return get(string: shared_login_info, defaultValue: "")
    }
    
    @objc static func setLoginInfo(value: String) {
        set(name: shared_login_info, value: value)
    }
    
    
    //base
    @objc static func set(name: String, value: Any) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: name)
        defaults.synchronize()
    }
    
    @objc static func get(string: String, defaultValue: String) -> String {
        let defaults = UserDefaults.standard
        let str = defaults.string(forKey: string) ?? defaultValue
        return str
        
    }
    
    @objc static func get(int: String, defaultValue: NSInteger) -> NSInteger {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: int)
    }
    
    @objc static func get(bool: String, defaultValue: Bool) -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: bool)
    }
    
    
}
