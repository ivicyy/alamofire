//
//  TimeUtils.swift
//  Runner
//
//  Created by KayoXu on 2019/11/13.
//  Copyright © 2019 Kayo Xu. All rights reserved.
//

import UIKit

class TimeUtils: NSObject {
    
    @objc static let defaultTime = "2018-01-01 00:00:00"
    
    @objc static func date2Str(date:Date, dateFormat:String="yyyy-MM-dd HH:mm:ss",showLoga:Bool = true) -> String {
        let timeZone = TimeZone.current //TimeZone.init(identifier: "UTC")
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        //         formatter.locale = Locale.init(identifier: "zh_CN")
        //        formatter.locale = Locale.init(identifier: Locale.preferredLanguages[0])
        formatter.dateFormat = dateFormat
        let dat = formatter.string(from: date)
        if showLoga {
            print("🌶️ 时间 --- date2Str ","\(Locale.preferredLanguages[0]) --- \(date) ------ \(dat)")
        }
        return dat
    }
    
    @objc static func str2Date(_ string:String, dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> Date {
        let formatter = DateFormatter()
        //                formatter.locale = Locale.init(identifier: Locale.preferredLanguages[0])
        formatter.dateFormat = dateFormat
        let date = formatter.date(from: string)
        print("🌶️ 时间 --- str2Date ","\(Locale.preferredLanguages[0]) --- \(date!) ------ \(string)")
        return date!
    }
    
    
    @objc static func getNowDate(second:Int = 0)->Date{        
        var date = Date.init(timeIntervalSinceNow: TimeInterval(second))
        if(buddhism()){
            let dateStr = date2Str(date: date,showLoga: false)
            date = str2Date(formatBuddhism(dateStr: dateStr))
//            date =  str2Date("2029-01-19 16:14:16")
        }
        print("🌶️ 时间 --- getNowDate ","\(Locale.preferredLanguages[0]) --- \(date))------ \(date2Str(date: date,showLoga: false))")
        return date
    }
    
    
    
    @objc static func buddhism(second:Int = 0)->Bool{
        return false
    }
    
    
    @objc static func formatBuddhism(dateStr:String)->String{
        var dateS = dateStr
        
        if TimeUtils.buddhism() {
            let ss = dateS.split(separator: "-")
            dateS = dateStr.replace(of: String(ss[0]), with: "\(String(ss[0]).toInt() - 543)")
        }
        return dateS
    }
    
}
