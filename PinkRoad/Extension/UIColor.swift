//
//  UIColor.swift
//  PinkRoad
//
//  Created by 박진수 on 20/06/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
    
    class var fourStationColor: UIColor {
        return UIColor(red: 43/255, green: 163/255, blue: 230/255, alpha: 1)
    }
    
    class var sixStationColor: UIColor {
        return UIColor(red: 176, green: 72, blue: 4)
    }
    
    class var threeStationColor: UIColor {
        return UIColor(red: 255, green: 114, blue: 3)
    }
    
    class var bgColor: UIColor {
        return UIColor(hex: 0xe9edf0)
    }
}
