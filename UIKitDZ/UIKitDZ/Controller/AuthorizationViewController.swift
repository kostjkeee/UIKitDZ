// AuthorizationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// main view controller
class AuthorizationViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var securityButton: UIButton!

    // MARK: - Private Properties

    var securityButtonClicked = false

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
        if securityButtonClicked {
            passwordTextField.isSecureTextEntry = true
            sender.setImage(UIImage(named: "closed"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = false
            sender.setImage(UIImage(named: "open"), for: .normal)
        }
        securityButtonClicked = !securityButtonClicked
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
