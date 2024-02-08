// AuthorizationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// main view controller
class AuthorizationViewController: UIViewController {
    var securityButtonClicked = false

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var securityButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
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
        guard let text = sender.text else { return }
        if !text.isEmpty, text != " " {
            loginButton.backgroundColor = UIColor(red: 22 / 255, green: 189 / 255, blue: 205 / 255, alpha: 1.0)
        }
    }

    @IBAction func typedPassword(_ sender: UITextField) {
//        sender.isSecureTextEntry = true
        guard let text = sender.text else { return }
        if !text.isEmpty, text != " " {
            loginButton.backgroundColor = UIColor(red: 22 / 255, green: 189 / 255, blue: 205 / 255, alpha: 1.0)
        }
    }

    @IBAction func pressedLogin(_ sender: UIButton) {
        guard let cafeViewController = storyboard?
            .instantiateViewController(withIdentifier: "CafeVC") as? CafeViewController else { return }
        navigationController?.pushViewController(cafeViewController, animated: true)
    }
}

extension UITextField {
    func setUnderLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: bounds.height + 7, width: 335, height: 1)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        borderStyle = UITextField.BorderStyle.none
        layer.addSublayer(bottomLine)
    }
}
