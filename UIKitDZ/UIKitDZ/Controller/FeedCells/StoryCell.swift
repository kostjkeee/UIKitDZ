// StoryCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомная ячейка для историй
class StoryCell: UITableViewCell {
    // MARK: - Costants

    enum Constants {
        static let plusImageName = "plus"
        static let myLabelText = "Ваша история"
        static let otherPeopleName = "lavanda123"
    }

    static let identifier = "StoryCell"

    // MARK: - Visual Components

    private var scrollView = UIScrollView()
    private var myImageView = UIImageView()
    private var pinkImageView = UIImageView()
    private var plusImageView = UIImageView()
    private var anotherImageView = UIImageView()
    private var anotherImageView2 = UIImageView()
    private var anotherImageView3 = UIImageView()
    private var anotherImageView4 = UIImageView()
    private var anotherImageView5 = UIImageView()
    private var myLabel = UILabel()
    private var label2 = UILabel()
    private var label3 = UILabel()
    private var label4 = UILabel()
    private var label5 = UILabel()
    private var label6 = UILabel()

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
        myImageView.image = UIImage(named: FeedViewController.Constants.myStoryImage)
        anotherImageView.image = UIImage(named: FeedViewController.Constants.storyImageName)
        anotherImageView2.image = UIImage(named: FeedViewController.Constants.storyImageName)
        anotherImageView3.image = UIImage(named: FeedViewController.Constants.storyImageName)
        anotherImageView4.image = UIImage(named: FeedViewController.Constants.storyImageName)
        anotherImageView5.image = UIImage(named: FeedViewController.Constants.storyImageName)
        plusImageView.image = UIImage(systemName: Constants.plusImageName)
        myLabel.textColor = .lightGray
        label2.textColor = .black
        label3.textColor = .black
        label4.textColor = .black
        label5.textColor = .black
        label6.textColor = .black
        myLabel.text = Constants.myLabelText
        myLabel.font = UIFont(name: MainTabBarController.Constants.verdana, size: 8)
        label2.text = Constants.otherPeopleName
        label2.font = UIFont(name: MainTabBarController.Constants.verdana, size: 8)
        label3.text = Constants.otherPeopleName
        label3.font = UIFont(name: MainTabBarController.Constants.verdana, size: 8)
        label4.text = Constants.otherPeopleName
        label4.font = UIFont(name: MainTabBarController.Constants.verdana, size: 8)
        label5.text = Constants.otherPeopleName
        label5.font = UIFont(name: MainTabBarController.Constants.verdana, size: 8)
        label6.text = Constants.otherPeopleName
        label6.font = UIFont(name: MainTabBarController.Constants.verdana, size: 8)
        plusImageView.tintColor = .white
        plusImageView.contentMode = .scaleAspectFill
        pinkImageView.backgroundColor = UIColor(red: 233 / 255, green: 70 / 255, blue: 94 / 255, alpha: 1.0)
        pinkImageView.contentMode = .scaleAspectFit
        pinkImageView.layer.cornerRadius = 10
        pinkImageView.clipsToBounds = true
        scrollView.showsHorizontalScrollIndicator = false
        myImageView.contentMode = .scaleAspectFill
        myImageView.layer.cornerRadius = 30
        myImageView.clipsToBounds = true
        anotherImageView.contentMode = .scaleAspectFill
        anotherImageView.layer.cornerRadius = 30
        anotherImageView.clipsToBounds = true
        anotherImageView2.contentMode = .scaleAspectFill
        anotherImageView2.layer.cornerRadius = 30
        anotherImageView2.clipsToBounds = true
        anotherImageView3.contentMode = .scaleAspectFill
        anotherImageView3.layer.cornerRadius = 30
        anotherImageView3.clipsToBounds = true
        anotherImageView4.contentMode = .scaleAspectFill
        anotherImageView4.layer.cornerRadius = 30
        anotherImageView4.clipsToBounds = true
        anotherImageView5.contentMode = .scaleAspectFill
        anotherImageView5.layer.cornerRadius = 30
        anotherImageView5.clipsToBounds = true
    }

    private func setupConstraints() {
        contentView.addSubview(scrollView)
        scrollView.addSubview(myImageView)
        scrollView.addSubview(anotherImageView)
        scrollView.addSubview(anotherImageView2)
        scrollView.addSubview(anotherImageView3)
        scrollView.addSubview(anotherImageView4)
        scrollView.addSubview(anotherImageView5)
        scrollView.addSubview(pinkImageView)
        scrollView.addSubview(myLabel)
        scrollView.addSubview(label2)
        scrollView.addSubview(label3)
        scrollView.addSubview(label4)
        scrollView.addSubview(label5)
        scrollView.addSubview(label6)
        scrollView.addSubview(plusImageView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        anotherImageView.translatesAutoresizingMaskIntoConstraints = false
        anotherImageView2.translatesAutoresizingMaskIntoConstraints = false
        anotherImageView3.translatesAutoresizingMaskIntoConstraints = false
        anotherImageView4.translatesAutoresizingMaskIntoConstraints = false
        anotherImageView5.translatesAutoresizingMaskIntoConstraints = false
        pinkImageView.translatesAutoresizingMaskIntoConstraints = false
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false
        label4.translatesAutoresizingMaskIntoConstraints = false
        label5.translatesAutoresizingMaskIntoConstraints = false
        label6.translatesAutoresizingMaskIntoConstraints = false
        plusImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            myImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            myImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            myImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            myImageView.widthAnchor.constraint(equalToConstant: 60),
            myImageView.heightAnchor.constraint(equalToConstant: 60),
            pinkImageView.leadingAnchor.constraint(equalTo: myImageView.leadingAnchor, constant: 40),
            pinkImageView.topAnchor.constraint(equalTo: myImageView.topAnchor, constant: 41),
            pinkImageView.trailingAnchor.constraint(equalTo: myImageView.trailingAnchor),
            pinkImageView.heightAnchor.constraint(equalToConstant: 20),
            pinkImageView.widthAnchor.constraint(equalToConstant: 20),
            plusImageView.centerXAnchor.constraint(equalTo: pinkImageView.centerXAnchor),
            plusImageView.centerYAnchor.constraint(equalTo: pinkImageView.centerYAnchor),
            plusImageView.heightAnchor.constraint(equalToConstant: 10),
            plusImageView.widthAnchor.constraint(equalToConstant: 10),
            anotherImageView.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 22),
            anotherImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            anotherImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            anotherImageView.widthAnchor.constraint(equalToConstant: 60),
            anotherImageView.heightAnchor.constraint(equalToConstant: 60),
            anotherImageView2.leadingAnchor.constraint(equalTo: anotherImageView.trailingAnchor, constant: 22),
            anotherImageView2.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            anotherImageView2.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            anotherImageView2.widthAnchor.constraint(equalToConstant: 60),
            anotherImageView2.heightAnchor.constraint(equalToConstant: 60),
            anotherImageView3.leadingAnchor.constraint(equalTo: anotherImageView2.trailingAnchor, constant: 22),
            anotherImageView3.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            anotherImageView3.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            anotherImageView3.widthAnchor.constraint(equalToConstant: 60),
            anotherImageView3.heightAnchor.constraint(equalToConstant: 60),
            anotherImageView4.leadingAnchor.constraint(equalTo: anotherImageView3.trailingAnchor, constant: 22),
            anotherImageView4.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            anotherImageView4.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            anotherImageView4.widthAnchor.constraint(equalToConstant: 60),
            anotherImageView4.heightAnchor.constraint(equalToConstant: 60),
            anotherImageView5.leadingAnchor.constraint(equalTo: anotherImageView4.trailingAnchor, constant: 22),
            anotherImageView5.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            anotherImageView5.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            anotherImageView5.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            anotherImageView5.widthAnchor.constraint(equalToConstant: 60),
            anotherImageView5.heightAnchor.constraint(equalToConstant: 60),
            myLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 5),
            myLabel.centerXAnchor.constraint(equalTo: myImageView.centerXAnchor),
            label2.topAnchor.constraint(equalTo: anotherImageView.bottomAnchor, constant: 5),
            label2.centerXAnchor.constraint(equalTo: anotherImageView.centerXAnchor),
            label3.topAnchor.constraint(lessThanOrEqualTo: anotherImageView2.bottomAnchor, constant: 5),
            label3.centerXAnchor.constraint(equalTo: anotherImageView2.centerXAnchor),
            label4.topAnchor.constraint(equalTo: anotherImageView3.bottomAnchor, constant: 5),
            label4.centerXAnchor.constraint(equalTo: anotherImageView3.centerXAnchor),
            label5.topAnchor.constraint(equalTo: anotherImageView4.bottomAnchor, constant: 5),
            label5.centerXAnchor.constraint(equalTo: anotherImageView4.centerXAnchor),
            label6.topAnchor.constraint(equalTo: anotherImageView5.bottomAnchor, constant: 5),
            label6.centerXAnchor.constraint(equalTo: anotherImageView5.centerXAnchor)
        ])
    }
}
