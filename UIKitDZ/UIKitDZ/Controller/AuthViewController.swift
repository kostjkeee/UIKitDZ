// AuthViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Начальный экран, на котором проходим авторизацию
final class AuthViewController: UIViewController {
    // MARK: - Private Properties

    private var isSecurityModeOn = true {
        didSet {
            if isSecurityModeOn {
                securityModeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
                passwordTextField.isSecureTextEntry = true
            } else {
                securityModeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
                passwordTextField.isSecureTextEntry = false
            }
        }
    }

    private let calendarImageView: UIImageView = {
        let calendar = UIImageView(frame: CGRect(x: 125, y: 70, width: 125, height: 125))
        calendar.image = UIImage(named: "calendarCake")
        return calendar
    }()

    private let birthdayReminderLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 200, width: 175, height: 44))
        label.textColor = .myPurple
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "Verdana-bold", size: 18)
        label.text = "Birthday \n Reminder"
        return label
    }()

    private let signInLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 266, width: 175, height: 31))
        label.textColor = .myRed
        label.font = UIFont(name: "Verdana-bold", size: 26)
        label.text = "Sign in"
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 318, width: 175, height: 19))
        label.textColor = .myRed
        label.text = "Email"
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 393, width: 175, height: 19))
        label.textColor = .myRed
        label.text = "Password"
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private let emailTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 347, width: 175, height: 17))
        textField.placeholder = "Typing email"
        textField.addTarget(nil, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 422, width: 129, height: 17))
        textField.placeholder = "Typing password"
        textField.addTarget(nil, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()

    private let securityModeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 332, y: 419, width: 22, height: 19))
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.tintColor = UIColor(red: 151 / 255, green: 162 / 255, blue: 176 / 255, alpha: 1.0)
        button.addTarget(nil, action: #selector(changeSecurityMode), for: .touchUpInside)
        return button
    }()

    private let loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 671, width: 335, height: 44))
        button.backgroundColor = .myRed
        button.setTitle("Login", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont(name: "Verdana-bold", size: 16)
        button.addTarget(nil, action: #selector(navigateToBirthdayViewController), for: .touchUpInside)
        return button
    }()

    private let switchLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 86, y: 544, width: 150, height: 35))
        label.text = "Use FaceID"
        label.font = UIFont(name: "Verdana-bold", size: 16)
        label.isHidden = true
        return label
    }()

    private let faceIDSwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.frame.origin = CGPoint(x: 248, y: 544)
        mySwitch.isOn = true
        mySwitch.isHidden = true
        return mySwitch
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        print("")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(calendarImageView)
        view.addSubview(birthdayReminderLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(passwordLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(securityModeButton)
        view.addSubview(loginButton)
        view.addSubview(switchLabel)
        view.addSubview(faceIDSwitch)
        loginButton.isEnabled = false
        loginButton.layer.opacity = 0.5
        loginButton.layer.cornerRadius = 12
        passwordTextField.isSecureTextEntry = true
        emailTextField.setUnderLine()
        passwordTextField.setUnderLine()
    }

    @objc private func changeSecurityMode(sender: UIButton) {
        isSecurityModeOn = !isSecurityModeOn
    }

    @objc private func textFieldDidChange() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }

        guard email.hasValidCharacter,
              !email.isEmpty,
              !email.hasSpaces,
              password.hasValidCharacter,
              !password.isEmpty,
              !password.hasSpaces
        else {
            loginButton.isEnabled = false
            loginButton.layer.opacity = 0.5
            switchLabel.isHidden = true
            faceIDSwitch.isHidden = true
            return
        }
        loginButton.isEnabled = true
        loginButton.layer.opacity = 1.0
        switchLabel.isHidden = false
        faceIDSwitch.isHidden = false
    }

    @objc private func navigateToBirthdayViewController() {
        let nextViewController = BirthdayListViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
