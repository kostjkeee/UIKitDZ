// SubscriptionCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Ячейка для подписки
class SubscriptionCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let avatarImageName = "storyImage"
        static let didSubscribeLabelText = "Вы подписаны"
    }

    static let identifier = "SubscriptionCell"

    // MARK: - Visual Components

    private var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: Constants.avatarImageName)
        return imageView
    }()

    private var commentTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: MainTabBarController.Constants.verdana, size: 12)
        label.numberOfLines = 0
        return label
    }()

    private var subscriptionButton: UIButton = {
        let button = UIButton()
        button.setTitle(RecommendCell.Constants.subscribeButtonText, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .myBlue
        button.titleLabel?.font = UIFont(name: MainTabBarController.Constants.verdanaBold, size: 10)
        return button
    }()

    // MARK: - Private Properties

    private var didUserSubscribe = false {
        didSet {
            if didUserSubscribe {
                subscriptionButton.setTitle(Constants.didSubscribeLabelText, for: .normal)
                subscriptionButton.setTitleColor(.lightGray, for: .normal)
                subscriptionButton.backgroundColor = .white
                subscriptionButton.layer.borderWidth = 1
                subscriptionButton.layer.borderColor = UIColor.lightGray.cgColor
            }
        }
    }

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    public func configureCell(
        avatarImageName: String,
        userName: String,
        activityType: String,
        passedTime: String,
        didUserSubscribe: Bool
    ) {
        avatarImageView.image = UIImage(named: avatarImageName)
        let mainText = NSMutableAttributedString(
            string: userName,
            attributes: [NSAttributedString.Key.font: UIFont(
                name: MainTabBarController.Constants.verdanaBold,
                size: 12
            ) ?? ""]
        )
        let activityText = NSAttributedString(
            string: " \(activityType)",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: MainTabBarController.Constants.verdana, size: 12) ?? ""
            ]
        )
        let time = NSAttributedString(
            string: " \(passedTime)",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: MainTabBarController.Constants.verdana, size: 12) ?? "",
                NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ]
        )
        mainText.append(activityText)
        mainText.append(time)
        commentTextLabel.attributedText = mainText
        self.didUserSubscribe = didUserSubscribe
    }

    // MARK: - Private Methods

    private func setupUI() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(commentTextLabel)
        contentView.addSubview(subscriptionButton)
    }

    private func setupConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        commentTextLabel.translatesAutoresizingMaskIntoConstraints = false
        subscriptionButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            commentTextLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 7),
            commentTextLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            commentTextLabel.widthAnchor.constraint(equalToConstant: 154),
            commentTextLabel.heightAnchor.constraint(equalToConstant: 55),
            commentTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            subscriptionButton.leadingAnchor.constraint(equalTo: commentTextLabel.trailingAnchor, constant: 8),
            subscriptionButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12),
            subscriptionButton.centerYAnchor.constraint(equalTo: commentTextLabel.centerYAnchor),
            subscriptionButton.widthAnchor.constraint(equalToConstant: 140),
            subscriptionButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
