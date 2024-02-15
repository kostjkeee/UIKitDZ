// UIViewController+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для создания кастомных вью
extension UIViewController {
    /// Создает кастомный UIView
    /// - Parameter  x: желаемая позиция по x
    /// - Parameter y: желаемая позиция по y
    /// - Parameter width: желаемая ширина
    /// - Parameter height: желаемая высота
    /// - Returns: экземпляр UIView
    func makeCustomView(
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

    /// Создает кастомный UILabel
    /// - Parameter x: желаемая позиция по x
    /// - Parameter y: желаемая позиция по y
    /// - Parameter width:  желаемая ширина
    /// - Parameter height:  желаемая высота
    /// - Parameter font:  желаемый шрифт
    /// - Parameter fontSize:  желаемый размер шрифта
    /// - Parameter color:  желаемый цвет текста
    /// - Parameter regularLabelText:  желаемый текст без модификаций
    /// - Parameter attributedLabelText:  желаемый текст с модификациями
    /// - Parameter textAlignment:  желаемое выравнивание текста
    /// - Returns: экземпляр UILabel
    func makeCustomLabel(
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
        label.adjustsFontSizeToFitWidth = true
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

    /// Создает кастомный UISwitch
    /// - Parameter x: желаемая позиция по x
    /// - Parameter y: желаемая позиция по y
    /// - Parameter width - желаемая ширина
    /// - Parameter height - желаемая высота
    /// - Returns: экземпляр UISwitch
    func makeCustomSwitch(xPosition: Int, yPosition: Int, width: Int, height: Int) -> UISwitch {
        let customSwitch = UISwitch(frame: CGRect(x: xPosition, y: yPosition, width: width, height: height))
        customSwitch.isOn = false
        return customSwitch
    }

    /// Создает кастомный UIButton
    /// - Parameter action: желаемое действие при нажатии на кнопку (@objc func)
    /// - Returns: экземпляр UIButton
    func makeCancelButton(action: Selector?) -> UIButton {
        guard let safeAction = action else { return UIButton() }
        let button = UIButton(frame: CGRect(x: 20, y: 26, width: 14, height: 14))
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: safeAction, for: .touchUpInside)
        button.imageView?.tintColor = .black
        return button
    }

    /// Создает кастомный UIImageView
    /// - Parameter x: желаемая позиция по x
    /// - Parameter y: желаемая позиция по y
    /// - Parameter width - желаемая ширина
    /// - Parameter height - желаемая высота
    /// - Parameter imageName: желаемое изображение
    /// - Returns: экземпляр UIImageView
    func makeDecorationImageView(
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
