//
//  YsEntityUtils.swift
//  Runner
//
//  Created by KayoXu on 2019/11/13.
//  Copyright © 2019 Kayo Xu. All rights reserved.
//

import UIKit

@objc  class JsonUtils: NSObject {
    
    static func getEntity<T: Codable>(_ type:T.Type,obj: Any?) ->  T? {
        do {
            if obj is String {
                let jsonData = try  JSONSerialization.data(withJSONObject: JsonUtils.json2Dic(jsonString: obj as! String) , options:.prettyPrinted)
                let   model = try JSONDecoder().decode(type, from: jsonData)
                return model
            }else{
                let jsonData = try  JSONSerialization.data(withJSONObject: obj ?? {}, options:.prettyPrinted)
                let   model = try JSONDecoder().decode(type, from: jsonData)
                return model
            }
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getEntityList<T: Codable>(_ type:[T].Type,obj: Any ) ->  [T]? {
        var arr:[T] = []
        if obj is Array<Any> {
            arr = getEntity(type, obj: obj) ?? []
        }else if obj is String{
            let a = json2Array(jsonString: obj as! String)
            arr = getEntity(type, obj: a) ?? []
        }
        return arr
    }
    
    static func toJsony<T: Codable>(model:T)->String{
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(model)
        if nil == jsonData {return ""}
        let json = String(data: jsonData!, encoding: String.Encoding.utf8) ?? ""
        return json
    }
    
    
    static func json2Array(jsonString:String) ->NSArray{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if array != nil {
            return array as! NSArray
        }
        return array as! NSArray
    }
    
    @objc static  func json2Dic(jsonString:String) ->NSDictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
    
    static func dic2Json(dictionary:NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }
    static  func arr2Json(array:NSArray) -> String {
        
        if (!JSONSerialization.isValidJSONObject(array)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: array, options: []) as NSData
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
    }
}
