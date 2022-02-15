//
//  UIColor.swift
//  TFBlue
//
//  Created by Kayo Xu on 2018/11/6.
//  Copyright © 2018 Kayo Xu. All rights reserved.
//

@objc extension UIColor {
    
    @objc static let colorPrimary : UIColor = UIColor.hexStringToColor(hexString: "#1E6FF4")  //标题栏蓝色
    @objc static let colorPrimaryLite : UIColor = UIColor.hexStringToColor(hexString: "#5f91f8") //标题栏淡蓝色蓝色
    @objc static let colorAccent : UIColor = UIColor.hexStringToColor(hexString: "#1E6FF4") //主色蓝色
    @objc static let colorAccentLite : UIColor = UIColor.hexStringToColor(hexString: "#991E6FF4") //主色淡蓝色
    @objc static let colorAccentLiteLite : UIColor = UIColor.hexStringToColor(hexString: "#E2ECFD") //超淡蓝色
    @objc static let colorWhite : UIColor = UIColor.hexStringToColor(hexString: "#FFFFFF")  //白色
    @objc static let colorWhiteLite : UIColor = UIColor.hexStringToColor(hexString: "#FFFFFF")  //次白色
    @objc static let colorBlack : UIColor = UIColor.hexStringToColor(hexString: "#000000") //黑色
    @objc static let colorBlackLite : UIColor = UIColor.hexStringToColor(hexString: "#484555") //次黑色
    @objc static let colorRed : UIColor = UIColor.hexStringToColor(hexString: "#FF6666")  //
    @objc static let colorRedLite : UIColor = UIColor.hexStringToColor(hexString: "#ee8888")  //
    @objc static let colorRedLiteLite : UIColor = UIColor.hexStringToColor(hexString: "#33EB9796")  //
    @objc static let colorGray : UIColor = UIColor.hexStringToColor(hexString: "#787878")  //
    @objc static let colorGrayLite : UIColor = UIColor.hexStringToColor(hexString: "#999999")  //
    @objc static let colorGrayLiteLite : UIColor = UIColor.hexStringToColor(hexString: "#B8B8B8")  //
    @objc static let colorYellow : UIColor = UIColor.hexStringToColor(hexString: "#EB962B")  //
    @objc static let colorYellowLite : UIColor = UIColor.hexStringToColor(hexString: "#F4CC4C")  //
    
    @objc  class func hexStringToColor(hexString: String) -> UIColor{
        var cString: String = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        var a : UInt32 = 0xff
        cString = cString.uppercased()
 
        if cString.count < 6 {
            return UIColor.black
        }
        if cString.hasPrefix("0X") {
            //cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 2))
            cString = String(cString[cString.index(cString.startIndex, offsetBy: 2)...])
        }
        if cString.hasPrefix("#") {
            //cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 1))
            cString = String(cString[cString.index(cString.startIndex, offsetBy: 1)...])
        }
        if cString.count != 6 {
            if cString.count == 8{
                let aRange: NSRange = NSMakeRange(0, 2)
                let aString = (cString as NSString).substring(with: aRange)
                Scanner.init(string: aString).scanHexInt32(&a)
                cString = String(cString[cString.index(cString.startIndex, offsetBy: 2)...])
            }else{
                return UIColor.black
            }
        }
        var range: NSRange = NSMakeRange(0, 2)
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        Scanner.init(string: rString).scanHexInt32(&r)
        Scanner.init(string: gString).scanHexInt32(&g)
        Scanner.init(string: bString).scanHexInt32(&b)
        //        return UIColor(displayP3Red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(1))
        if #available(iOS 10.0, *) {
            return UIColor(displayP3Red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(a)/255.0)
        } else {
            return UIColor(red:CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(a)/255.0)
        }
    }
    
}

