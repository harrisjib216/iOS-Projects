//
//  Helper.swift
//  TaxiTap
//
//  Created by Jibril Harris on 8/10/17.
//  Copyright © 2017 harrisjib. All rights reserved.
//

import UIKit
import Foundation


struct ColliderType {
    static let CAR_COLLIDER:UInt32 = 0
    static let ITEM_COLLIDER1:UInt32 = 1
    static let ITEM_COLLIDER2:UInt32 = 2
}


class Helper: NSObject {
    func randomBetween(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}


var lastScore = 0
