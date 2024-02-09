// Label+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

extension UILabel {
    func setUnderLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: bounds.height + 2, width: 335, height: 1)
        bottomLine.backgroundColor = UIColor(red: 208 / 255, green: 214 / 255, blue: 222 / 255, alpha: 1.0).cgColor
        layer.addSublayer(bottomLine)
    }
}
