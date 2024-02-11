// AuthorizationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// main view controller
final class AuthorizationViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var loginButton: UIButton!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var securityButton: UIButton!

    // MARK: - Private Properties

    var isSecurityButtonClicked = false

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        loginButton.isEnabled = false
        passwordTextField.isSecureTextEntry = true
        loginButton.layer.cornerRadius = 10
        loginTextField.setUnderLine()
        passwordTextField.setUnderLine()
    }

    @IBAction func toggleSecurityMode(_ sender: UIButton) {
        if isSecurityButtonClicked {
            passwordTextField.isSecureTextEntry = true
            sender.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = false
            sender.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
        isSecurityButtonClicked = !isSecurityButtonClicked
    }

    @IBAction func typedLogin(_ sender: UITextField) {
        guard let login = sender.text,
              let password = passwordTextField.text else { return }
        if !login.isEmpty, !login.contains(" "), !password.isEmpty, !password.contains(" ") {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor(red: 22 / 255, green: 189 / 255, blue: 205 / 255, alpha: 1.0)
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor(red: 22 / 255, green: 189 / 255, blue: 205 / 255, alpha: 0.5)
        }
    }

    @IBAction func typedPassword(_ sender: UITextField) {
        guard let password = sender.text,
              let login = loginTextField.text else { return }
        if !password.isEmpty, !password.contains(" "), !login.isEmpty, !login.contains(" ") {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor(red: 22 / 255, green: 189 / 255, blue: 205 / 255, alpha: 1.0)
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor(red: 22 / 255, green: 189 / 255, blue: 205 / 255, alpha: 0.5)
        }
    }

    @IBAction func pressedLogin(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToCafe", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "segueToCafe" else { return }
        guard let destination = segue.destination as? CafeViewController else { return }
        destination.usernameEmail = loginTextField.text
    }
}
