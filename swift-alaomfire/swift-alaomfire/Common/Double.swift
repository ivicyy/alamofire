//
//  Double.swift
//  Runner
//
//  Created by flm002 on 2021/10/15.
//

import Foundation

extension Double {
    func getScreenWidth() -> Double {
        return UIScreen.main.bounds.width
    }
    
    public func toSystemFont() -> UIFont {
        return UIFont.systemFont(ofSize: self)
    }
    
    public func toBoldFont() -> UIFont {
        return UIFont.boldSystemFont(ofSize: self)
    }
    
    func fit() -> CGFloat {
        return CGFloat(self) * UIScreen.main.bounds.width / 320
    }
    
    func getDate() -> NSDate {
        return NSDate.init(timeIntervalSinceReferenceDate: self)
    }
    
    func getTime(format:String?) -> NSString {
        let date:NSDate = self.getDate()
        return date.string(withFormat: format ?? "yyyy-MM-dd HH:mm:ss")! as NSString
    }
}

extension NSLayoutConstraint {
    @IBInspectable var adapterScreen: Bool {
        get {
            return true
        }
        
        set {
            if newValue {
                self.constant = self.constant * suitParm
            }
            
        }
    }
}

