// StackViewViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стек вью
class StackViewViewController: UIViewController {
    // MARK: - Visual Components

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()

    private let blackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()

    private let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        return view
    }()

    private let yellowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemYellow
        return view
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        return view
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupStackView()
        setupBlackView()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.addSubview(blackView)
        blackView.addSubview(stackView)
    }

    private func setupBlackView() {
        NSLayoutConstraint.activate([
            blackView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -15),
            blackView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15),
            blackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -15),
            blackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 15),

        ])
    }

    private func setupStackView() {
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 45)
            .isActive = true
        stackView.bottomAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -44)
            .isActive = true
        stackView.heightAnchor.constraint(equalToConstant: CGFloat(stackView.arrangedSubviews.count * 110 + 16))
            .isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 110).isActive = true
    }
}
