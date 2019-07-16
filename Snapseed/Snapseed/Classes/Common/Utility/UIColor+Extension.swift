//
//  UIColor+Extension.swift
//  Snapseed
//
//  Created by Xuli Chen on 2019/7/16.
//  Copyright © 2019 Huni. All rights reserved.
//

import UIKit

public let kThemeBlackColor    :UIColor    = UIColor.hexColor(hexColor:0x6E6E6E)

extension UIColor {
    @objc static func hexColor(hexColor:Int64) -> UIColor{
        
        let red = ((CGFloat)((hexColor & 0xFF0000) >> 16))/255.0;
        let green = ((CGFloat)((hexColor & 0xFF00) >> 8))/255.0;
        let blue = ((CGFloat)(hexColor & 0xFF))/255.0;
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
        
    }
}

