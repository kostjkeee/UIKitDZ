// LikedCommentCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Уведомления от других пользователей
class LikedCommentCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let avatarImageName = "storyImage"
        static let respondLabelText = "Ответить"
    }

    static let identifier = "LikedCommentCell"

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

    private var likedPictureImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private var likeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: PostCell.Constants.heartImageName)
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .lightGray
        return imageView
    }()

    private var respondLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.respondLabelText
        label.font = UIFont(name: MainTabBarController.Constants.verdana, size: 10)
        label.textColor = .lightGray
        return label
    }()

    // MARK: - Private Properties

    private var isRespondNeeded = false {
        didSet {
            respondLabel.isHidden = isRespondNeeded ? false : true
            likeImageView.isHidden = isRespondNeeded ? false : true
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
        commentText: String,
        passedTime: String,
        likedImageName: String,
        shouldAddRespond: Bool
    ) {
        avatarImageView.image = UIImage(named: avatarImageName)
        likedPictureImageView.image = UIImage(named: likedImageName)
        isRespondNeeded = shouldAddRespond
        let mainText = NSMutableAttributedString(
            string: userName,
            attributes: [NSAttributedString.Key.font: UIFont(
                name: MainTabBarController.Constants.verdanaBold,
                size: 12
            ) ?? ""]
        )
        let activityText = NSAttributedString(
            string: " \(activityType):",
            attributes: [
                NSAttributedString.Key
                    .font: UIFont(name: MainTabBarController.Constants.verdana, size: 12) ?? ""
            ]
        )
        let comment = NSAttributedString(
            string: " \(commentText)",
            attributes: [
                NSAttributedString.Key
                    .font: UIFont(name: MainTabBarController.Constants.verdana, size: 12) ?? ""
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
        mainText.append(comment)
        mainText.append(time)
        commentTextLabel.attributedText = mainText
    }

    // MARK: - Private Methods

    private func setupUI() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(commentTextLabel)
        contentView.addSubview(likeImageView)
        contentView.addSubview(likedPictureImageView)
        contentView.addSubview(respondLabel)
    }

    private func setupConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        commentTextLabel.translatesAutoresizingMaskIntoConstraints = false
        likeImageView.translatesAutoresizingMaskIntoConstraints = false
        likedPictureImageView.translatesAutoresizingMaskIntoConstraints = false
        respondLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            commentTextLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 7),
            commentTextLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            commentTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16),
            commentTextLabel.widthAnchor.constraint(equalToConstant: 240),
            commentTextLabel.heightAnchor.constraint(equalToConstant: 40),
            likedPictureImageView.leadingAnchor.constraint(equalTo: commentTextLabel.trailingAnchor, constant: 24),
            likedPictureImageView.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            likedPictureImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12),
            likedPictureImageView.widthAnchor.constraint(equalToConstant: 40),
            likedPictureImageView.heightAnchor.constraint(equalToConstant: 40),
            likeImageView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            likeImageView.leadingAnchor.constraint(equalTo: commentTextLabel.leadingAnchor),
            likeImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -300),
            likeImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            likeImageView.widthAnchor.constraint(equalToConstant: 16),
            likeImageView.heightAnchor.constraint(equalToConstant: 16),
            respondLabel.centerYAnchor.constraint(equalTo: likeImageView.centerYAnchor),
            respondLabel.leadingAnchor.constraint(equalTo: likeImageView.trailingAnchor, constant: 10),
            respondLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            respondLabel.heightAnchor.constraint(equalToConstant: 16),
            respondLabel.widthAnchor.constraint(equalToConstant: 240),
        ])
    }
}
