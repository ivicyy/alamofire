//
//  NSObject.swift
//  TFBlue
//
//  Created by Kayo Xu on 2019/1/15.
//  Copyright © 2019 smarthome. All rights reserved.
//

import UIKit

extension String {

    func md5() -> String {
        if self.empty() {
            return ""
        }
        let cStr = self.cString(using: String.Encoding.utf8)
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!, (CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0..<16 {
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }

    func empty() -> Bool {
        if nil == self
                   || self.isKind(of: NSNull.classForCoder())
                   || 0 == self.count {
            return true
        }
        return false
    }

    func equal(to: String) -> Bool {
        if self.empty() || to.empty() {
            return false
        } else {
            return self == to
        }
    }


    func replace(of: String, with: String) -> String {

        if self.empty() {
            return ""
        } else if nil != of && nil != with {
            return self.replacingOccurrences(of: of, with: with)
        } else {
            return self as String
        }
    }


    func contains(withSub: String) -> Bool {
        return !self.empty() && !withSub.empty() && self.contains(withSub)
    }

    func isNumber() -> Bool {
        if SysUtils.isNULL(obj: self) {
            return false
        }
        let scan: Scanner = Scanner(string: self as String)
        var val: NSInteger = 0
        return scan.scanInt(&val) && scan.isAtEnd
    }


    func toInt() -> NSInteger {
        if self.isNumber() {
            return Int(self) ?? -1
        } else {
            return -1
        }
    }

    /// 将十六进制颜色转伟UIColor
        /// - Returns: UIColor
    public func toColor() -> UIColor {
      //处理数值
       var cString = self.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
       let length = (cString as NSString).length
        //错误处理
        if (length < 6 || length > 7 || (!cString.hasPrefix("#") && length == 7)){
           return UIColor.white
        }

        if cString.hasPrefix("#"){
           cString = (cString as NSString).substring(from: 1)
        }
        
        //字符chuan截取
        var range = NSRange()
        range.location = 0
        range.length = 2
        
        let rString = (cString as NSString).substring(with: range)
        
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        //存储转换后的数值
        var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0
        //进行转换
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        //根据颜色值创建UIColor
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
    
    public func toImage() -> UIImage {
        return UIImage(named: self)!
    }
    
    public func toUrl() -> URL {
        return URL(string: self)!
    }
    
    public func toNsUrl() -> NSURL {
        return self.toUrl() as NSURL
    }
}
