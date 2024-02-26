// NSLayoutAnchorViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Autolayout code
class NSLayoutAnchorViewController: UIViewController {
    // MARK: - Visual Components

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
        setupViews()
    }

    // MARK: - Private Methods

    private func setupViews() {
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
        view.addSubview(blackView)
        blackView.addSubview(redView)
        blackView.addSubview(yellowView)
        blackView.addSubview(greenView)

        setupRedViewConstraints()
        setupYellowViewConstraints()
        setupGreenViewConstraints()
        setupBlackViewConstraints()
    }

    private func setupBlackViewConstraints() {
        NSLayoutConstraint.activate([
            blackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -15),
            blackView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: -15),
            blackView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 15),
            blackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 15)
        ])
    }

    private func setupRedViewConstraints() {
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(
                greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 44
            ),
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redView.heightAnchor.constraint(greaterThanOrEqualToConstant: 90),
            redView.heightAnchor.constraint(equalToConstant: 110),
            redView.widthAnchor.constraint(equalTo: redView.heightAnchor),
        ])
    }

    private func setupYellowViewConstraints() {
        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 8),
            yellowView.centerXAnchor.constraint(equalTo: redView.centerXAnchor),
            yellowView.heightAnchor.constraint(equalTo: redView.heightAnchor),
            yellowView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    private func setupGreenViewConstraints() {
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 8),
            greenView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor),
            greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor),
            greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor),
//            greenView.bottomAnchor.constraint(
//                greaterThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor,
//                constant: -45
//            )
        ])
    }
}
