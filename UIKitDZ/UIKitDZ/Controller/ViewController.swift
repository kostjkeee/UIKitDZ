// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// main view controller
class ViewController: UIViewController {
    // MARK: - Constants

    let model = ReversedWord()

    // MARK: - Private Properties

    private let textButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 406, width: 335, height: 44))
        button.setTitle("Начать", for: .normal)
        button.backgroundColor = UIColor(red: 76 / 255, green: 216 / 255, blue: 102 / 255, alpha: 1.0)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Verdana-bold", size: 16)
        button.addTarget(nil, action: #selector(showAlert), for: .touchUpInside)
        return button
    }()

    private let firstLabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 106, width: 275, height: 57))
        label.textColor = .black
        label.font = UIFont(name: "Verdana-bold", size: 16)
        label.text = "Вы ввели слово"
        label.textAlignment = .center
        return label
    }()

    private let secondLabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 282, width: 275, height: 57))
        label.textColor = .black
        label.font = UIFont(name: "Verdana-bold", size: 16)
        label.numberOfLines = 0
        label.text = "А вот что получится, если \n читать справа налево"
        label.textAlignment = .center
        return label
    }()

    private let firstTextView = {
        let textView = UITextView(frame: CGRect(x: 50, y: 163, width: 275, height: 57))
        textView.textColor = .gray
        textView.font = UIFont(name: "Verdana-italic", size: 16)
        textView.textAlignment = .center
        return textView
    }()

    private let secondTextView = {
        let textView = UITextView(frame: CGRect(x: 50, y: 339, width: 275, height: 57))
        textView.textColor = .gray
        textView.font = UIFont(name: "Verdana-italic", size: 16)
        textView.textAlignment = .center
        return textView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(textButton)
    }

    // MARK: - Private Methods

    private func showLabelsAndTextViews() {
        textButton.frame = CGRect(x: 20, y: 598, width: 335, height: 44)
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(firstTextView)
        view.addSubview(secondTextView)
    }

    @objc private func showAlert() {
        let alertController = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Введите слово"
        }
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Ок", style: .default, handler: { [weak self] _ in
            guard let userText = alertController.textFields?[0].text else { return }
            let result = self?.model.reverseUserWord(word: userText)
            self?.firstTextView.text = userText
            self?.secondTextView.text = result
            self?.showLabelsAndTextViews()
        }))
        present(alertController, animated: true)
    }
}
