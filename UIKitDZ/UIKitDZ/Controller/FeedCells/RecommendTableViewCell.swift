// RecommendTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомная ячейка для рекомендованных друзей
class RecommendCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let recommendLabelText = "Рекомендуем вам"
        static let allLabelText = "Все"
        static let firstUserImageName = "avatarImage"
        static let secondUserImageName = "woman"
        static let subscribeButtonText = "Подписаться"
        static let firstUserName = "crimea_082"
        static let secondUserName = "mary_pol"
        static let xMarkImageName = "xmark"
    }

    static let identifier = "RecommendCell"

    // MARK: - Visual Components

    private let scrollView = UIScrollView()

    private let recommentLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.recommendLabelText
        label.font = UIFont(name: MainTabBarController.Constants.verdanaBold, size: 10)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()

    private let allLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.allLabelText
        label.font = UIFont(name: MainTabBarController.Constants.verdanaBold, size: 10)
        label.textColor = UIColor(red: 0 / 255, green: 122 / 255, blue: 255 / 255, alpha: 1.0)
        label.textAlignment = .right
        return label
    }()

    private let firstView = UIView()
    private let secondView = UIView()

    private let firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.firstUserImageName)
        return imageView
    }()

    private let secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.secondUserImageName)
        return imageView
    }()

    private let firstButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.subscribeButtonText, for: .normal)
        button.backgroundColor = UIColor(red: 0 / 255, green: 122 / 255, blue: 255 / 255, alpha: 1.0)
        button.titleLabel?.font = UIFont(name: MainTabBarController.Constants.verdanaBold, size: 10)
        return button
    }()

    private let secondButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.subscribeButtonText, for: .normal)
        button.backgroundColor = UIColor(red: 0 / 255, green: 122 / 255, blue: 255 / 255, alpha: 1.0)
        button.titleLabel?.font = UIFont(name: MainTabBarController.Constants.verdanaBold, size: 10)
        return button
    }()

    private let firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.firstUserName
        label.font = UIFont(name: MainTabBarController.Constants.verdana, size: 10)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    private let seconNameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.secondUserName
        label.font = UIFont(name: MainTabBarController.Constants.verdana, size: 10)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    private var xImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.xMarkImageName)
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        return imageView
    }()

    private var secondXImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.xMarkImageName)
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        return imageView
    }()

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

    // MARK: - Private Methods

    private func setupUI() {
        backgroundColor = UIColor(red: 210 / 255, green: 223 / 255, blue: 238 / 255, alpha: 1.0)
        contentView.addSubview(scrollView)
        firstView.addSubview(firstImageView)
        firstView.addSubview(firstNameLabel)
        firstView.addSubview(firstButton)
        firstView.addSubview(xImageView)
        secondView.addSubview(secondImageView)
        secondView.addSubview(seconNameLabel)
        secondView.addSubview(secondButton)
        secondView.addSubview(secondXImageView)
        scrollView.addSubview(firstView)
        scrollView.addSubview(secondView)
        contentView.addSubview(allLabel)
        contentView.addSubview(recommentLabel)
        firstButton.layer.cornerRadius = 10
        secondButton.layer.cornerRadius = 10
        firstImageView.layer.cornerRadius = 57.5
        firstImageView.clipsToBounds = true
        firstImageView.contentMode = .scaleAspectFill
        secondImageView.layer.cornerRadius = 57.5
        secondImageView.clipsToBounds = true
        secondImageView.contentMode = .scaleAspectFill
        firstView.backgroundColor = .white
        secondView.backgroundColor = .white
        scrollView.showsHorizontalScrollIndicator = false
    }

    func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstImageView.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondImageView.translatesAutoresizingMaskIntoConstraints = false
        seconNameLabel.translatesAutoresizingMaskIntoConstraints = false
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        xImageView.translatesAutoresizingMaskIntoConstraints = false
        allLabel.translatesAutoresizingMaskIntoConstraints = false
        recommentLabel.translatesAutoresizingMaskIntoConstraints = false
        secondXImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),

            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 45),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            firstView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            firstView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            firstView.widthAnchor.constraint(equalToConstant: 185),
            firstView.heightAnchor.constraint(equalToConstant: 200),
            firstImageView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 35),
            firstImageView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 15),
            firstImageView.widthAnchor.constraint(equalToConstant: 115),
            firstImageView.heightAnchor.constraint(equalToConstant: 115),
            firstNameLabel.topAnchor.constraint(equalTo: firstImageView.bottomAnchor, constant: 5),
            firstNameLabel.centerXAnchor.constraint(equalTo: firstImageView.centerXAnchor),
            firstButton.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 10),
            firstButton.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 9),
            firstButton.widthAnchor.constraint(equalToConstant: 165),
            firstButton.heightAnchor.constraint(equalToConstant: 30),
            secondView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: 20),
            secondView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            secondView.widthAnchor.constraint(equalToConstant: 185),
            secondView.heightAnchor.constraint(equalToConstant: 200),
            secondImageView.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 35),
            secondImageView.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 15),
            secondImageView.widthAnchor.constraint(equalToConstant: 115),
            secondImageView.heightAnchor.constraint(equalToConstant: 115),
            seconNameLabel.topAnchor.constraint(equalTo: secondImageView.bottomAnchor, constant: 5),
            seconNameLabel.centerXAnchor.constraint(equalTo: secondImageView.centerXAnchor),
            secondButton.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 10),
            secondButton.topAnchor.constraint(equalTo: seconNameLabel.bottomAnchor, constant: 9),
            secondButton.widthAnchor.constraint(equalToConstant: 165),
            secondButton.heightAnchor.constraint(equalToConstant: 30),
            xImageView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 169.5),
            xImageView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 8.5),
            xImageView.widthAnchor.constraint(equalToConstant: 7),
            xImageView.heightAnchor.constraint(equalToConstant: 7),
            secondXImageView.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 169.5),
            secondXImageView.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 8.5),
            secondXImageView.widthAnchor.constraint(equalToConstant: 7),
            secondXImageView.heightAnchor.constraint(equalToConstant: 7),
            recommentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            recommentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            recommentLabel.heightAnchor.constraint(equalToConstant: 15),
            recommentLabel.widthAnchor.constraint(equalToConstant: 107),
            allLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            allLabel.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            allLabel.widthAnchor.constraint(equalToConstant: 107),
            allLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
}
