// UserInfoTableCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Информация о пользователе
class UserInfoTableCell: UITableViewCell {
    // MARK: - Types

    typealias StringHandler = (String) -> (Void)

    // MARK: - Constanats

    enum Constants {
        static let addFriendImageName = "addPersonImage"
        static let spaceXurl = "https://www.spacex.com/vehicles/starship/"
    }

    static let identifier = "UserInfoCell"

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "girl")
        return imageView
    }()

    private let addStoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 13
        imageView.backgroundColor = .myPink
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: StoryTableCell.Constants.plusImageName)
        return imageView
    }()

    private let postsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: MainTabBarController.Constants.verdana, size: 10)
        label.textAlignment = .center
        label.text = "публикации"
        return label
    }()

    private let subscribersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: MainTabBarController.Constants.verdana, size: 10)
        label.textAlignment = .center
        label.text = "подписчики"
        return label
    }()

    private let subscriptionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: MainTabBarController.Constants.verdana, size: 10)
        label.textAlignment = .center
        label.text = "подписки"
        return label
    }()

    private let postsCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: MainTabBarController.Constants.verdanaBold, size: 14)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "67"
        return label
    }()

    private let subscribersCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: MainTabBarController.Constants.verdanaBold, size: 14)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "458"
        return label
    }()

    private let subscriptionsCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: MainTabBarController.Constants.verdanaBold, size: 14)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "120"
        return label
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: MainTabBarController.Constants.verdanaBold, size: 14)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "Мария Иванова"
        return label
    }()

    private let userOccupationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: MainTabBarController.Constants.verdana, size: 14)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "Консультант"
        return label
    }()

    private let urlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.font = UIFont(name: MainTabBarController.Constants.verdana, size: 14)
        label.textColor = .myAnotherBlue
        label.text = "www.spacex.com"
        return label
    }()

    private let changeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setTitle("Изменить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: MainTabBarController.Constants.verdanaBold, size: 10)
        button.backgroundColor = .myGray
        return button
    }()

    private let shareProfileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setTitle("Поделиться профилем", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: MainTabBarController.Constants.verdanaBold, size: 10)
        button.backgroundColor = .myGray
        return button
    }()

    private let addFriendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: Constants.addFriendImageName), for: .normal)
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .myGray
        return button
    }()

    // MARK: - Public Properties

    var presentWkWebViewHandler: StringHandler?

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupAvatarImageViewConstraints()
        setupAddStoryImageViewConstraints()
        setupPlusImageViewConstraints()
        setupPostsConstraints()
        setupSubscribersConstraints()
        setupSubscriptionsConstraints()
        setupUserInfoConstraints()
        setupButtonsConstraints()
        setupGestureRecognizer()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    public func configure(userInfo: UserInfo) {
        avatarImageView.image = UIImage(named: userInfo.avatarImageName)
        postsCount.text = userInfo.postsCount
        subscribersCount.text = userInfo.subscribersCount
        subscriptionsCount.text = userInfo.subscriptionsCount
        userNameLabel.text = userInfo.username
        userOccupationLabel.text = userInfo.occupation
        urlLabel.text = userInfo.url
    }

    // MARK: - Private Methods

    private func setupUI() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(addStoryImageView)
        contentView.addSubview(plusImageView)
        contentView.addSubview(postsLabel)
        contentView.addSubview(subscribersLabel)
        contentView.addSubview(subscriptionsLabel)
        contentView.addSubview(postsCount)
        contentView.addSubview(subscribersCount)
        contentView.addSubview(subscriptionsCount)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(userOccupationLabel)
        contentView.addSubview(urlLabel)
        contentView.addSubview(changeButton)
        contentView.addSubview(shareProfileButton)
        contentView.addSubview(addFriendButton)
    }

    private func setupGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(urlTapped))
        urlLabel.addGestureRecognizer(tapGesture)
    }

    private func setupAvatarImageViewConstraints() {
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setupAddStoryImageViewConstraints() {
        addStoryImageView.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor).isActive = true
        addStoryImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor).isActive = true
        addStoryImageView.widthAnchor.constraint(equalToConstant: 26.67).isActive = true
        addStoryImageView.heightAnchor.constraint(equalToConstant: 26.67).isActive = true
    }

    private func setupPlusImageViewConstraints() {
        plusImageView.centerXAnchor.constraint(equalTo: addStoryImageView.centerXAnchor).isActive = true
        plusImageView.centerYAnchor.constraint(equalTo: addStoryImageView.centerYAnchor).isActive = true
        plusImageView.heightAnchor.constraint(equalToConstant: 13).isActive = true
        plusImageView.widthAnchor.constraint(equalToConstant: 13).isActive = true
    }

    private func setupPostsConstraints() {
        postsLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 46).isActive = true
        postsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 29).isActive = true
        postsLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        postsLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        postsCount.centerXAnchor.constraint(equalTo: postsLabel.centerXAnchor).isActive = true
        postsCount.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10).isActive = true
        postsCount.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func setupSubscribersConstraints() {
        subscribersLabel.leadingAnchor.constraint(equalTo: postsLabel.trailingAnchor).isActive = true
        subscribersLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 29).isActive = true
        subscribersLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        subscribersLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscribersCount.centerXAnchor.constraint(equalTo: subscribersLabel.centerXAnchor).isActive = true
        subscribersCount.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10).isActive = true
        subscribersCount.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func setupSubscriptionsConstraints() {
        subscriptionsLabel.leadingAnchor.constraint(equalTo: subscribersLabel.trailingAnchor).isActive = true
        subscriptionsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 29).isActive = true
        subscriptionsLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        subscriptionsLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscriptionsCount.centerXAnchor.constraint(equalTo: subscriptionsLabel.centerXAnchor).isActive = true
        subscriptionsCount.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10).isActive = true
        subscriptionsCount.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func setupUserInfoConstraints() {
        userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor).isActive = true
        userNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 9).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        userOccupationLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor).isActive = true
        userOccupationLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 11).isActive = true
        userOccupationLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        urlLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor).isActive = true
        urlLabel.topAnchor.constraint(equalTo: userOccupationLabel.bottomAnchor, constant: 6).isActive = true
        urlLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setupButtonsConstraints() {
        changeButton.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor).isActive = true
        changeButton.topAnchor.constraint(equalTo: urlLabel.bottomAnchor, constant: 15).isActive = true
        changeButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        changeButton.widthAnchor.constraint(equalToConstant: 155).isActive = true

        shareProfileButton.leadingAnchor.constraint(equalTo: changeButton.trailingAnchor, constant: 5).isActive = true
        shareProfileButton.topAnchor.constraint(equalTo: urlLabel.bottomAnchor, constant: 15).isActive = true
        shareProfileButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        shareProfileButton.widthAnchor.constraint(equalToConstant: 155).isActive = true

        addFriendButton.leadingAnchor.constraint(equalTo: shareProfileButton.trailingAnchor, constant: 5)
            .isActive = true
        addFriendButton.topAnchor.constraint(equalTo: urlLabel.bottomAnchor, constant: 15).isActive = true
        addFriendButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        addFriendButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        addFriendButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    @objc private func urlTapped() {
        presentWkWebViewHandler?(Constants.spaceXurl)
    }
}
