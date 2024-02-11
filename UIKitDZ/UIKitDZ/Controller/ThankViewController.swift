// ThankViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Последний экран, для выражения благодарности  пользователю
final class ThankViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var closeButton: UIButton!

    // MARK: - Public Properties

    public var userEmail: String?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        closeButton.layer.cornerRadius = 10
        if let safeUserEmail = userEmail, var safeLabel = descriptionLabel.text {
            safeLabel += safeUserEmail
            descriptionLabel.text = safeLabel
        }
    }

    @IBAction private func pressedClose(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
