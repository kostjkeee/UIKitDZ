// ThanksViewController.swift
// Copyright © RoadMap. All rights reserved.

//
//  ThanksViewController.swift
//  UIKitDZ
//
//  Created by Vermut xxx on 13.02.2024.
//
/// thanks view controller
import UIKit

final class ThanksViewController: UIViewController {
    // MARK: - Private Properties

    private let flowersImageView = {
        let imageView = UIImageView(image: UIImage(named: "flowers"))
        imageView.frame = CGRect(x: 92, y: 58, width: 200, height: 86.62)
        return imageView
    }()

    private let thanksImageView = {
        let imageView = UIImageView(image: UIImage(named: "thanks"))
        imageView.frame = CGRect(x: 75, y: 184, width: 235, height: 128)
        return imageView
    }()

    private let tellAboutUsLabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 362, width: 315, height: 89))
        label.text = """
        Разскажи о насъ другу, отправь ему\nпромокодъ на безплатный напитокъ и получи скидку 10% на слѣдующій заказъ.
        """
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = UIColor(red: 135.0 / 250.0, green: 135.0 / 250.0, blue: 135.0 / 250.0, alpha: 0.8)
        return label
    }()

    private let okayButton = {
        let button = UIButton(frame: .init(x: 20, y: 632, width: 335, height: 44))
        button.setTitle("Хорошо", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 89.0 / 250.0, green: 190.0 / 250.0, blue: 199.0 / 250.0, alpha: 1.0)
        button.layer.cornerRadius = 12
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        okayButton.addTarget(self, action: #selector(okayTapped), for: .touchUpInside)
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(okayButton)
        view.addSubview(flowersImageView)
        view.addSubview(thanksImageView)
        view.addSubview(tellAboutUsLabel)
    }

    @objc private func okayTapped() {
        let menuVC = MenuViewController()
        menuVC.modalPresentationStyle = .fullScreen
        present(menuVC, animated: true)
    }
}
