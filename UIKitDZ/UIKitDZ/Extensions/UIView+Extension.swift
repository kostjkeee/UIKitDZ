// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширяет функционал uiview и всех ее наследников, позволяющий создавать серую линию.
extension UIView {
    func setUnderLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: bounds.height + 8, width: 335, height: 1)
        bottomLine.backgroundColor = UIColor(red: 208 / 255, green: 214 / 255, blue: 222 / 255, alpha: 1.0).cgColor
        layer.addSublayer(bottomLine)
    }
}
