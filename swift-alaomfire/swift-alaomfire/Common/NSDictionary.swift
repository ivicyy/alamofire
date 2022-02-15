//
//  NSObject.swift
//  TFBlue
//
//  Created by Kayo Xu on 2019/1/15.
//  Copyright © 2019 smarthome. All rights reserved.
//

import UIKit

@objc extension NSDictionary {

    @objc func getValue(int: String)->NSInteger {
        if SysUtils.isNULL(obj: self) {
            return -1
        } else {
            let obj = self.object(forKey: int)
            if SysUtils.isNULL(obj: obj as Any){
                return -1
            }else {
                if !(obj is NSInteger) {
                    return -1
                }else {
                    return obj as! NSInteger
                }
            }
        }
    }

    @objc func getValue(string: String)->String {
        if SysUtils.isNULL(obj: self) {
            return ""
        } else {
            let obj = self.object(forKey: string)
            if SysUtils.isNULL(obj: obj as Any){
                return ""
            }else {
                if !(obj is String) {
                    return ""
                }else {
                    return  obj as! String
                }
            }
        }
    }


    @objc func getValue(double: String)->Double {
        if SysUtils.isNULL(obj: self) {
            return -1
        } else {
            let obj = self.object(forKey: double)
            if SysUtils.isNULL(obj: obj as Any){
                return -1
            }else {
                if !(obj is Double) {
                    return -1
                }else {
                    return obj as! Double
                }
            }
        }
    }


}