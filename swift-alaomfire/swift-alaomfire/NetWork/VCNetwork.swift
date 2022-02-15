//
//  VCNetwork.swift
//  Runner
//
//  Created by ivic-flm on 2021/3/29.
//

import UIKit
import Alamofire


//实用codable协议解析数据
//舍弃了loading库，需要自加
class VCNetwork<T:Codable> {
    public func requestData(url:String,para:[String: Any],completion:@escaping(_ response:T)->(),failure:@escaping(_ error:Error)->()) {
        let headers: HTTPHeaders = ["accept": "application/json","Content-Type": "application/json",]
        let convertible = baseUrl + testUrl
        AF.request(convertible,method: .post,parameters:para,encoding:JSONEncoding.default, headers: headers).responseJSON { (response) in
            print("请求地址:",response.request?.url ?? "")
            print("请求头:",response.request?.headers ?? "")
            print("请求参数:",para)
            switch response.result {
            case .success(let data):
                print("返回数据:",data)
                let decoder = JSONDecoder()
                do {
                    let jsonData = try? JSONSerialization.data(withJSONObject: data, options: [])
                    let jsonModel = try decoder.decode(T.self, from: jsonData!)
                    completion(jsonModel)
                } catch {
                    print("JSON 解析失败")
                }
                break
                
            case .failure(let error):
                failure(error)
                print(error)
                break
            }
        }
    }
}
