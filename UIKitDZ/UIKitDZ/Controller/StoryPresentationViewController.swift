// StoryPresentationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Показывает нажатую  историю на весь экран
final class StoryPresentationViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let cornerRadius = 15
    }

    // MARK: - Visual Components

    private var timer = Timer()

    private var storyMiniImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()

    private var storyMiniTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: MainTabBarController.Constants.verdana, size: 10)
        label.textColor = .white
        return label
    }()

    private var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()

    private var storyFullImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private var xMarkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .myDarkestGray
        button.contentMode = .scaleAspectFill
        return button
    }()

    // MARK: - Public Properties

    var fullImageNameToShow: String?
    var miniImageNameToShow: String?
    var storyTextToShow: String?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupStoryImageView()
        setupProgressView()
        setupTimer()
        setupStoryMiniImageView()
        setupStoryMiniTextLabel()
        setupXmarkButton()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(storyFullImageView)
        storyFullImageView.addSubview(storyMiniImageView)
        storyFullImageView.addSubview(storyMiniTextLabel)
        storyFullImageView.addSubview(progressView)
        storyFullImageView.addSubview(xMarkButton)
        storyFullImageView.isUserInteractionEnabled = true

        guard let fullImageName = fullImageNameToShow,
              let miniImageName = miniImageNameToShow,
              let storyText = storyTextToShow else { return }
        storyFullImageView.image = UIImage(named: fullImageName)
        storyMiniImageView.image = UIImage(named: miniImageName)
        storyMiniTextLabel.text = storyText
    }

    private func setupTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(changeProgressView),
            userInfo: nil,
            repeats: true
        )
    }

    private func setupStoryImageView() {
        storyFullImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        storyFullImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        storyFullImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        storyFullImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setupStoryMiniImageView() {
        storyMiniImageView.leadingAnchor.constraint(equalTo: storyFullImageView.leadingAnchor, constant: 5)
            .isActive = true
        storyMiniImageView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 9).isActive = true
        storyMiniImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        storyMiniImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setupStoryMiniTextLabel() {
        storyMiniTextLabel.leadingAnchor.constraint(equalTo: storyMiniImageView.trailingAnchor, constant: 7)
            .isActive = true
        storyMiniTextLabel.centerYAnchor.constraint(equalTo: storyMiniImageView.centerYAnchor).isActive = true
        storyMiniTextLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func setupXmarkButton() {
        xMarkButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        xMarkButton.trailingAnchor.constraint(equalTo: storyFullImageView.trailingAnchor, constant: -10).isActive = true
        xMarkButton.centerYAnchor.constraint(equalTo: storyMiniImageView.centerYAnchor).isActive = true
        xMarkButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        xMarkButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func setupProgressView() {
        progressView.progress = 0.0
        progressView.progressTintColor = .lightGray
        progressView.leadingAnchor.constraint(equalTo: storyFullImageView.leadingAnchor, constant: 5).isActive = true
        progressView.topAnchor.constraint(equalTo: storyFullImageView.topAnchor, constant: 11).isActive = true
        progressView.widthAnchor.constraint(equalToConstant: 365).isActive = true
    }

    @objc private func changeProgressView() {
        if progressView.progress != 1.0 {
            progressView.progress += 1.0 / 1000
        } else {
            timer.invalidate()
            dismiss(animated: true)
        }
    }

    @objc private func cancelTapped() {
        dismiss(animated: true)
    }
}
