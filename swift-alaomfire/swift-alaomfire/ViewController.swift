//
//  ViewController.swift
//  swift-alaomfire
//
//  Created by ivic-flm on 2022/2/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //传类名解析出相关数据
        VCNetwork<Station>().requestData(url: testUrl, para: ["rc":0]) { value in

        } failure: { error in

        }
    }


}

