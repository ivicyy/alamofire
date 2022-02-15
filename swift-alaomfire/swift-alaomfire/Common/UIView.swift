//
//  UIView.swift
//  Runner
//
//  Created by 范力升 on 2020/7/1.
//

import UIKit

@objc extension UIView {
    
    // MARK: - 常用位置属性
    @objc public var left:CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newLeft) {
            var frame = self.frame
            frame.origin.x = newLeft
            self.frame = frame
        }
    }
    
    @objc public var top:CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set(newTop) {
            var frame = self.frame
            frame.origin.y = newTop
            self.frame = frame
        }
    }
    
    @objc public var width:CGFloat {
        get {
            return self.frame.size.width
        }
        
        set(newWidth) {
            var frame = self.frame
            frame.size.width = newWidth
            self.frame = frame
        }
    }
    
    @objc public var height:CGFloat {
        get {
            return self.frame.size.height
        }
        
        set(newHeight) {
            var frame = self.frame
            frame.size.height = newHeight
            self.frame = frame
        }
    }
    
    @objc public var right:CGFloat {
        get {
            return self.left + self.width
        }
    }
    
    @objc public var bottom:CGFloat {
        get {
            return self.top + self.height
        }
    }
    
    @objc public var centerX:CGFloat {
        get {
            return self.center.x
        }
        
        set(newCenterX) {
            var center = self.center
            center.x = newCenterX
            self.center = center
        }
    }
    
    @objc public var centerY:CGFloat {
        get {
            return self.center.y
        }
        
        set(newCenterY) {
            var center = self.center
            center.y = newCenterY
            self.center = center
        }
    }
    
    /// 圆角设置
   ///
   /// - Parameters:
   ///   - view: 需要设置的控件
   ///   - corner: 哪些圆角
   ///   - radii: 圆角半径
   /// - Returns: layer图层
    @objc func configRectCorner(corner: UIRectCorner, radii: CGSize){
           
       let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: corner, cornerRadii: radii)
       
       let maskLayer = CAShapeLayer.init()
       maskLayer.frame = self.bounds
       maskLayer.path = maskPath.cgPath
       self.layer.mask = maskLayer;
    }
}
