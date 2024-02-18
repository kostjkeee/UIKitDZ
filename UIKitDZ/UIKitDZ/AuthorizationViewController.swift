// AuthorizationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран авторизации
final class AuthorizationViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let cafeName = "КофеиновЪ"
        static let authorization = "Авторизация"
        static let verdana = "Verdana"
        static let login = "Логин"
        static let password = "Пароль"
        static let enterEmail = "Введите почту"
        static let enterPassword = "Введите пароль"
        static let invisible = "invisible"
        static let visible = "visible"
        static let enter = "Войти"
        static let welcome = "Добро пожаловать, Гость"
        static let gLetter = "Г"
        static let adresses = "Адреса кофеен"
        static let accessToGeo = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни"
        static let geo = "geo"
        static let menu = "menu"
        static let cake = "cake"
        static let ptiPatealaRus = "Пти пате аля «РюсЪ»"
        static let tea = "tea"
        static let hotDrinks = "Горячiя напитки"
        static let coffee = "coffee"
        static let kofiy = "Кофий"
        static let arrow = "arrow"
        static let smsCode = "Кодъ из СМС"
        static let enterSmsCode = "ведите кодъ изъ смс, чтобы подтвердить оплатуС"
        static let sendAgain = "Отправить снова"
        static let confirm = "Подтвердить"
        static let flowers = "flowers"
        static let thanks = "thanks"
        static let tellAboutUs = """
        Разскажи о насъ другу, отправь ему\nпромокодъ на безплатный напитокъ и получи скидку 10% на слѣдующій заказъ.
        """
        static let okay = "Хорошо"
    }

    // MARK: - Visual Component

    private let logoImageView = {
        let imageView = UIImageView(image: UIImage(named: Constants.cafeName))
        imageView.frame = CGRect(x: 100, y: 103, width: 175, height: 76)
        return imageView
    }()

    private let backGroundView = {
        let view = UIView(frame: CGRect(x: 0, y: 248, width: 375, height: 564))
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()

    private let autorizationLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 280, width: 195, height: 31))
        label.text = Constants.authorization
        label.font = UIFont(name: Constants.verdana, size: 26)
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()

    private let loginLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 332, width: 175, height: 19))
        label.text = Constants.login
        label.font = UIFont(name: Constants.verdana, size: 16)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    private let passwordLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 407, width: 175, height: 19))
        label.text = Constants.password
        label.font = UIFont(name: Constants.verdana, size: 16)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    private let loginTextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 361, width: 335, height: 17))
        textField.font = UIFont(name: Constants.verdana, size: 14)
        textField.placeholder = Constants.enterEmail
        return textField
    }()

    private let passwordTextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 436, width: 335, height: 17))
        textField.font = UIFont(name: Constants.verdana, size: 14)
        textField.isSecureTextEntry = true
        textField.placeholder = Constants.enterPassword
        return textField
    }()

    private let showPasswordButton = {
        let button = UIButton(frame: .init(x: 332, y: 433, width: 22, height: 19))
        button.setImage(UIImage(named: Constants.invisible), for: .normal)
        return button
    }()

    private let loginButton = {
        let button = UIButton(frame: .init(x: 20, y: 664, width: 335, height: 44))
        button.isEnabled = false
        button.setTitle(Constants.enter, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 89.0 / 250.0, green: 190.0 / 250.0, blue: 199.0 / 250.0, alpha: 0.3)
        button.layer.cornerRadius = 12

        return button
    }()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = UIColor(red: 120.0 / 250.0, green: 84.0 / 250.0, blue: 49.0 / 250.0, alpha: 1.0)

        view.addSubview(logoImageView)
        view.addSubview(backGroundView)
        view.addSubview(autorizationLabel)
        view.addSubview(autorizationLabel)
        view.addSubview(loginLabel)
        view.addSubview(passwordLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(showPasswordButton)
        view.addSubview(loginButton)

        setutButtonsAndTextfields()
        addLineFor(loginTextField)
        addLineFor(passwordTextField)
    }

    private func setutButtonsAndTextfields() {
        loginTextField.addTarget(
            self,
            action: #selector(editingChanged),
            for: .editingChanged
        )

        passwordTextField.addTarget(
            self,
            action: #selector(editingChanged),
            for: .editingChanged
        )

        loginButton.addTarget(
            self,
            action: #selector(loginTapped),
            for: .touchUpInside
        )

        showPasswordButton.addTarget(
            self,
            action: #selector(showPasswordTapped),
            for: .touchUpInside
        )
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
        let imageName = passwordTextField.isSecureTextEntry ? Constants.invisible : Constants.visible
        showPasswordButton.setImage(UIImage(named: imageName), for: .normal)
    }

    @objc private func loginTapped() {
        let menuViewController = MenuViewController()
        navigationController?.setViewControllers([menuViewController], animated: true)
    }
}
