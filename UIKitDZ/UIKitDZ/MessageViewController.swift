// MessageViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  message view controller
final class MessageViewController: UIViewController {
    // MARK: - Private Properties

    private let backButton = {
        let button = UIButton(frame: .init(x: 22, y: 64, width: 40, height: 40))
        button.setImage(UIImage(named: "arrow"), for: .normal)
        return button
    }()

    private let smsCodeLabel = {
        let label = UILabel(frame: CGRect(x: 117, y: 57, width: 140, height: 30))
        label.text = "Кодъ из СМС"
        label.font = UIFont(name: "Verdana", size: 18)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    private let enterCodeLabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 146, width: 315, height: 44))
        label.text = "Введите кодъ изъ смс, чтобы подтвердить оплатуС"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "Verdana", size: 16)
        return label
    }()

    private let codeView = {
        let view = UIView(frame: CGRect(x: 61, y: 217, width: 262, height: 44))
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 16
        return view
    }()

    private let codeTextField = {
        let textField = UITextField(frame: CGRect(x: 92, y: 228, width: 200, height: 22))
        textField.font = UIFont(name: "Verdana", size: 18)
        textField.font = UIFont.boldSystemFont(ofSize: 18)
        textField.textAlignment = .center
        return textField
    }()

    private let sendAgainButton = {
        let button = UIButton(frame: .init(x: 109, y: 288, width: 167, height: 36))
        button.setTitle("Отправить снова", for: .normal)
        button.setTitleColor(
            UIColor(red: 89.0 / 250.0, green: 190.0 / 250.0, blue: 199.0 / 250.0, alpha: 1.0),
            for: .normal
        )
        button.backgroundColor = UIColor(red: 239.0 / 250.0, green: 247.0 / 250.0, blue: 247.0 / 250.0, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()

    private let confirmButton = {
        let button = UIButton(frame: .init(x: 20, y: 632, width: 335, height: 44))
        button.isEnabled = false
        button.setTitle("Подтвердить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 89.0 / 250.0, green: 190.0 / 250.0, blue: 199.0 / 250.0, alpha: 0.3)
        button.layer.cornerRadius = 12
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        codeTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        confirmButton.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(confirmButton)
        view.addSubview(smsCodeLabel)
        view.addSubview(enterCodeLabel)
        view.addSubview(codeView)
        view.addSubview(codeTextField)
        view.addSubview(sendAgainButton)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }

    @objc private func editingChanged() {
        guard let code = codeTextField.text,
              !code.isEmpty
        else {
            confirmButton.isEnabled = false
            confirmButton.backgroundColor = UIColor(
                red: 89.0 / 250.0,
                green: 190.0 / 250.0,
                blue: 199.0 / 250.0,
                alpha: 0.3
            )
            return
        }
        confirmButton.isEnabled = true
        confirmButton.backgroundColor = UIColor(
            red: 89.0 / 250.0,
            green: 190.0 / 250.0,
            blue: 199.0 / 250.0,
            alpha: 1.0
        )
    }

    @objc private func confirmTapped() {
        let thanksVC = ThanksViewController()
        navigationController?.pushViewController(thanksVC, animated: true)
    }

    @objc func backTapped() {
        print("кнопка баск нажмакана")
    }
}
