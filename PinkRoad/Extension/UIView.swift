//
//  UIView.swift
//  PinkRoad
//
//  Created by 박진수 on 19/06/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
}
