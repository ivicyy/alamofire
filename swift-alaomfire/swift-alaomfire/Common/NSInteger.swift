//
// Created by Kayo Xu on 2019-01-17.
// Copyright (c) 2019 smarthome. All rights reserved.
//

import UIKit

extension NSInteger {

    func toString() -> String {
        if SysUtils.isNULL(obj: self) {
            return ""
        } else {
            return "\(self)" 
        }
    }
}

