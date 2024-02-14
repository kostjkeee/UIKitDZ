// AutorizationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// autorization view controller
final class AutorizationViewController: UIViewController {
    // MARK: - Private Properties

    private let logoImageView = {
        let imageView = UIImageView(image: UIImage(named: "КофеиновЪ"))
        imageView.frame = CGRect(x: 100, y: 103, width: 175, height: 76)
        return imageView
    }()

    private let whiteView = {
        let view = UIView(frame: CGRect(x: 0, y: 248, width: 375, height: 564))
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()

    private let autorizationLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 280, width: 195, height: 31))
        label.text = "Авторизация"
        label.font = UIFont(name: "Verdana", size: 26)
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()

    private let loginLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 332, width: 175, height: 19))
        label.text = "Логин"
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    private let passwordLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 407, width: 175, height: 19))
        label.text = "Пароль"
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    private let loginTextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 361, width: 335, height: 17))
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.placeholder = "Введите почту"
        return textField
    }()

    private let passwordTextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 436, width: 335, height: 17))
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.isSecureTextEntry = true
        textField.placeholder = "Введите пароль"
        return textField
    }()

    private let showPasswordButton = {
        let button = UIButton(frame: .init(x: 332, y: 433, width: 22, height: 19))
        button.setImage(UIImage(named: "invisible"), for: .normal)
        return button
    }()

    private let loginButton = {
        let button = UIButton(frame: .init(x: 20, y: 664, width: 335, height: 44))
        button.isEnabled = false
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 89.0 / 250.0, green: 190.0 / 250.0, blue: 199.0 / 250.0, alpha: 0.3)
        button.layer.cornerRadius = 12
        return button
    }()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        loginTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        showPasswordButton.addTarget(self, action: #selector(showPasswordTapped), for: .touchUpInside)
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = UIColor(red: 120.0 / 250.0, green: 84.0 / 250.0, blue: 49.0 / 250.0, alpha: 1.0)

        view.addSubview(logoImageView)
        view.addSubview(whiteView)
        view.addSubview(autorizationLabel)
        view.addSubview(autorizationLabel)
        view.addSubview(loginLabel)
        view.addSubview(passwordLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(showPasswordButton)
        view.addSubview(loginButton)

        addLineFor(loginTextField)
        addLineFor(passwordTextField)
    }

    private func addLineFor(_ textFiled: UITextField) {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(
            x: 0,
            y: textFiled.frame.size.height - width,
            width: textFiled.frame.size.width,
            height: textFiled.frame.size.height
        )
        border.borderWidth = width
        textFiled.layer.addSublayer(border)
        textFiled.layer.masksToBounds = true
    }

    @objc private func editingChanged(_ textField: UITextField) {
        guard let login = loginTextField.text,
              !login.isEmpty,
              let password = passwordTextField.text,
              !password.isEmpty
        else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor(
                red: 89.0 / 250.0,
                green: 190.0 / 250.0,
                blue: 199.0 / 250.0,
                alpha: 0.3
            )
            return
        }
        loginButton.isEnabled = true
        loginButton.backgroundColor = UIColor(red: 89.0 / 250.0, green: 190.0 / 250.0, blue: 199.0 / 250.0, alpha: 1.0)
    }

    @objc private func showPasswordTapped() {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        let imageName = passwordTextField.isSecureTextEntry ? "invisible" : "visible"
        showPasswordButton.setImage(UIImage(named: imageName), for: .normal)
    }

    @objc private func loginTapped() {
        let menuVC = MenuViewController()
        menuVC.modalPresentationStyle = .fullScreen
        navigationController?.present(menuVC, animated: true)
    }
}
