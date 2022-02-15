//
//  NSObject.swift
//  TFBlue
//
//  Created by Kayo Xu on 2019/1/15.
//  Copyright © 2019 smarthome. All rights reserved.
//

import UIKit

@objc extension NSString {

    @objc func md5() -> String {
        if self.empty() {
            return ""
        }
        let cStr = self.cString(using: String.Encoding.utf8.rawValue)
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!, (CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0..<16 {
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }

    @objc func empty() -> Bool {
        if nil == self
                   || self.isKind(of: NSNull.classForCoder())
                   || 0 == self.length {
            return true
        }
        return false
    }

    @objc func equal(to: String) -> Bool {
        if self.empty() || to.empty() {
            return false
        } else {
            return self.isEqual(to: to)
        }
    }


    @objc func replace(of: String, with: String) -> String {

        if self.empty() {
            return ""
        } else if nil != of && nil != with {
            return self.replacingOccurrences(of: of, with: with)
        } else {
            return self as String
        }
    }


    @objc func contains(withSub: String) -> Bool {
        return !self.empty() && !withSub.empty() && self.contains(withSub)
    }

    @objc func isNumber() -> Bool {
        if SysUtils.isNULL(obj: self) {
            return false
        }
        let scan: Scanner = Scanner(string: self as String)
        var val: NSInteger = 0
        return scan.scanInt(&val) && scan.isAtEnd
    }


    @objc func toInt() -> NSInteger {
        if self.isNumber() {
            return self.integerValue
        } else {
            return -1
        }
    }

    @objc func isYsBleDevice()->Bool{
        let value  = self
        
        return value.length  > 5 && value.substring(with: NSRange(location: 4, length: 1)) == "-"
    }
    
    
    @objc func isYsBleKey()->Bool{
        let value  = self
        
        return  value.length  > 8 && value.substring(with: NSRange(location: 4, length: 1)) == "-" && value.substring(with: NSRange(location: 8, length: 1)) == "0"
    }
    




}
