//
//  SysUtils.swift
//  TFBlue
//
//  Created by Kayo Xu on 2019/1/15.
//  Copyright © 2019 smarthome. All rights reserved.
//

import UIKit

@objc class SysUtils: NSObject {
    
    @objc static func getUuid() -> String {
        let uuidRef = CFUUIDCreate(kCFAllocatorDefault)
        let strRef = CFUUIDCreateString(kCFAllocatorDefault, uuidRef)
        let uuidString = (strRef! as String).replacingOccurrences(of: "-", with: "")
        //         CFRelease(strRef)
        //         CFRelease(uuidRef)
        return uuidString
    }
    
    @objc static func listEmpty(arr: NSArray?) -> Bool {
        
        if nil == arr {
            return true;
        } else {
            return 0 == arr?.count
        }
        
    }
    
    
    @objc static func empty(str: String?) -> Bool {
        
        if nil == str {
            return true;
        } else {
            return 0 == str?.count
        }
        
    }
    
    @objc static func isNULL(obj: Any?) -> Bool {
        if nil == obj || obj is NSNull {
            return true
        }
        return false
    }
    
    
    @objc static func intToString(value: NSInteger) -> String {
        return value.toString();
    }
    
    @objc static func getValueString(value: Any?)->String{
        var str = ""
        if value is String {
            str = value as! String
        }else if   value is NSNumber{
            str = "\(value!)"
        }
        return str
    }
    
    @objc static func getValueInt(value: Any? , def: Int = 0)->Int{
        var ret = def
        if value is Int {
            ret = value as! Int
        }else if   value is NSNumber{
            ret = (value as! NSNumber).intValue
        }else if value is String{
            ret = Int(value as! String) ?? def
        }
        return ret
    }
    
    @objc static func getValueBool(value: Any? , def: Bool = false)->Bool{
        var ret = def
        if(value  is Bool){
            ret = value as! Bool
        }else if(value is String){
            let str = (value as! String).lowercased()
            if  str == "true" || str == "yes" || str == "1" {
                ret = true
            }
        }
        return ret
    }
    
    static func getValueDic(value: Any? ,dateFormat: String = "yyyy-MM-dd HH:mm:ss", date:[String]) -> Any{
        let dic = NSMutableDictionary.init( )
        var arr:[Dictionary<String, Any>] = []
        if(nil != value){
            if value is Dictionary<String, Any> {
                dic.setDictionary((value as! Dictionary))
            }else if (value is Array<Dictionary<String, Any>>){
                for v in (value as! Array<Dictionary<String,Any?>>){
                    arr.append(getValueDic(value: v, date: date) as! Dictionary)
                }
                return arr
            }
        }
        if(date.count > 0){
            for d in date{
                let t =  dic[d]
                if t is Date {
                    var dateStr :String = TimeUtils.date2Str(date: (t as! Date),dateFormat: dateFormat,showLoga: false)
                    dic.setValue(TimeUtils.formatBuddhism(dateStr: dateStr), forKey: d)
                }
            }
        }
        
        return dic
    }
    
    @objc static func getOsVersion()->String{
   
        return "iPhone|\(DeviceTools.getCurrentDeviceModel())|\(UIDevice.current.systemName)\(UIDevice.current.systemVersion)|\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "1")"
    }
}
