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
        isRespondNeeded = shouldAddRespond
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
            commentTextLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
//            commentTextLabel.trailingAnchor.constraint(equalTo: likedPictureImageView.leadingAnchor, constant: -24),
//            commentTextLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            commentTextLabel.widthAnchor.constraint(equalToConstant: 240),
            commentTextLabel.heightAnchor.constraint(equalToConstant: 40),
            likedPictureImageView.leadingAnchor.constraint(equalTo: commentTextLabel.trailingAnchor, constant: 24),
            likedPictureImageView.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            likedPictureImageView.widthAnchor.constraint(equalToConstant: 40),
            likedPictureImageView.heightAnchor.constraint(equalToConstant: 40),
            likeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 59),
            likeImageView.topAnchor.constraint(equalTo: commentTextLabel.bottomAnchor, constant: 2.69),
            likeImageView.widthAnchor.constraint(equalToConstant: 16),
            likeImageView.heightAnchor.constraint(equalToConstant: 16),
            likeImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            respondLabel.leadingAnchor.constraint(equalTo: likeImageView.trailingAnchor, constant: 10),
            respondLabel.topAnchor.constraint(equalTo: commentTextLabel.bottomAnchor),
            respondLabel.widthAnchor.constraint(equalToConstant: 240),
            respondLabel.centerYAnchor.constraint(equalTo: likeImageView.centerYAnchor),
            respondLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
