// UIImageView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UIImageView {
    func roundedImage() {
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
}
