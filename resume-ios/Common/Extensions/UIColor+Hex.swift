//
//  UIColor+Hex.swift
//  resume-ios
//
//  Created by Patrick Ngo on 2017-12-17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    
    convenience init(hex: Int) {
        self.init(red: (CGFloat((hex & 0xff0000) >> 16)) / 255.0, green: (CGFloat((hex & 0xff00) >> 8)) / 255.0, blue: (CGFloat(hex & 0xff)) / 255.0, alpha: 1.0)
    }
    
    
    struct Button {
        static let purple = UIColor(hex: 0x8D6BAB)
        static let blue = UIColor(hex: 0x517EC7)
        static let lightBlue = UIColor(hex: 0x2C94DB)
        static let lightGrey = UIColor(hex: 0xBBBBBB)
    }
    
    struct Text {
        static let darkBlue = UIColor(hex: 0x333447)
        static let darkGrey = UIColor(hex: 0x262626)
        static let altGrey = UIColor(hex: 0x555555)
    }
    
    struct Border {
        static let around = UIColor(hex: 0xF1F1F1)
        static let inside = UIColor(hex: 0xF4F4F4)
    }
    
    struct Background {
        static let grey = UIColor(hex: 0xF1F1F1)
    }
    
    struct NavBar {
        static let purple = UIColor(hex: 0x6441a5)
    }
}
