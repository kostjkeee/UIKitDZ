// TextField+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

extension UITextField {
    func setUnderLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: bounds.height + 7, width: 335, height: 1)
        bottomLine.backgroundColor = UIColor(red: 208 / 255, green: 214 / 255, blue: 222 / 255, alpha: 1.0).cgColor
        borderStyle = UITextField.BorderStyle.none
        layer.addSublayer(bottomLine)
    }
}
