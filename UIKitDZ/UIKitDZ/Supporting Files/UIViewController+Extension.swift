// UIViewController+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Расширяет функционал, во избежание повтора одного и того же кода позволяет всем контроллерам создавать кастомные вью
/// элементы
extension UIViewController {
    func createCustomView(
        xPosition: Int,
        yPosition: Int,
        width: Int,
        height: Int,
        corners: CACornerMask,
        color: String
    ) -> UIView {
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor(named: color)
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = corners
        return view
    }

    func createCustomLabel(
        xPosition: Int,
        yPosition: Int,
        width: Int,
        height: Int,
        font: String,
        fontSize: CGFloat,
        color: UIColor,
        regularLabelText: String,
        attributedLabelText: String?,
        textAlignment: NSTextAlignment
    ) -> UILabel {
        let label = UILabel(frame: CGRect(x: xPosition, y: yPosition, width: width, height: height))
        label.font = UIFont(name: font, size: fontSize)
        label.textColor = color
        label.textAlignment = textAlignment
        label.numberOfLines = 0

        if let safeAttributedText = attributedLabelText {
            let regularText = NSMutableAttributedString(
                string: regularLabelText,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
            )
            let attributedText = NSAttributedString(
                string: " +\(safeAttributedText)",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.myGreen]
            )
            regularText.append(attributedText)
            label.attributedText = regularText
        } else {
            label.text = regularLabelText
        }
        return label
    }

    func createCustomSwitch(xPosition: Int, yPosition: Int, width: Int, height: Int) -> UISwitch {
        let customSwitch = UISwitch(frame: CGRect(x: xPosition, y: yPosition, width: width, height: height))
        customSwitch.isOn = false
        return customSwitch
    }

    func createCancelButton(action: Selector?) -> UIButton {
        guard let safeAction = action else { return UIButton() }
        let button = UIButton(frame: CGRect(x: 20, y: 26, width: 14, height: 14))
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: safeAction, for: .touchUpInside)
        button.imageView?.tintColor = .black
        return button
    }

    func createDecorationImageView(
        xPosition: Int,
        yPosition: Int,
        width: Int,
        height: Int,
        imageName: String
    ) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: xPosition, y: yPosition, width: width, height: height))
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
}
