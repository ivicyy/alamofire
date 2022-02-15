//
//  ApiTestData.swift
//  swift-alaomfire
//
//  Created by ivic-flm on 2022/2/15.
//

import Foundation

public struct Station : Codable {
    var data: [data]
    
    struct data: Codable {
        var pointName: String
        var id: Int
    }
}
