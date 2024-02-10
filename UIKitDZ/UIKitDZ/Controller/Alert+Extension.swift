// Alert+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

extension UIViewController {
    func createAlert(title: String, message: String?, prefStyle: UIAlertController.Style) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: prefStyle)
        return alert
    }
}
