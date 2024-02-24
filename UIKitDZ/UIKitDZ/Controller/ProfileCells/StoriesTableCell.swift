// StoriesTableCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Истории пользователя
class StoriesTableCell: UITableViewCell {
    // MARK: - Types

    typealias StringHandler = (String, String, String) -> ()

    // MARK: - Constants

    enum Constants {
        static let storiesWidth: CGFloat = 55
        static let storyImageNameToPass = "openedStoryImage"
    }

    static let identifier = "StoriesCell"

    // MARK: - Visual Components

    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    // MARK: - Public Properties

    var storyInfoToPassToController: (String, String, String)?
    var passingInfoToControllerHandler: StringHandler?

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupScrollView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(stories: [Stories]) {
        scrollView.contentSize.width = Constants.storiesWidth * CGFloat(stories.count)
        makeStory(stories: stories)
    }

    // MARK: - Private Methods

    private func setupScrollView() {
        contentView.addSubview(scrollView)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    @objc private func storyTapped() {
        passingInfoToControllerHandler?(
            storyInfoToPassToController?.0 ?? "",
            storyInfoToPassToController?.1 ?? "",
            storyInfoToPassToController?.2 ?? ""
        )
    }

    private func makeStory(stories: [Stories]) {
        var offset = scrollView.leadingAnchor

        for (index, story) in stories.enumerated() {
            let storyNameLabel = UILabel()
            storyNameLabel.text = story.storyName
            storyNameLabel.font = UIFont(name: MainTabBarController.Constants.verdana, size: 10)
            storyNameLabel.textAlignment = .center
            storyNameLabel.translatesAutoresizingMaskIntoConstraints = false

            let storyImageView = UIImageView()
            storyImageView.image = UIImage(named: story.imageName)
            storyImageView.contentMode = .scaleAspectFill
            storyImageView.layer.cornerRadius = 27.5
            storyImageView.layer.borderColor = UIColor.myDarkGray.cgColor
            storyImageView.layer.borderWidth = 3
            storyImageView.clipsToBounds = true
            storyImageView.translatesAutoresizingMaskIntoConstraints = false

            scrollView.addSubview(storyNameLabel)
            scrollView.addSubview(storyImageView)

            if story.isTapNeeded {
                let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(storyTapped))
                storyImageView.isUserInteractionEnabled = true
                storyImageView.addGestureRecognizer(tapRecognizer)
                storyInfoToPassToController = (Constants.storyImageNameToPass, story.imageName, story.storyName)
            }

            storyImageView.leadingAnchor.constraint(equalTo: offset, constant: 15).isActive = true
            storyImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17).isActive = true
            storyImageView.heightAnchor.constraint(equalToConstant: 55).isActive = true
            storyImageView.widthAnchor.constraint(equalToConstant: 55).isActive = true
            if index == stories.count - 1 {
                storyImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -5)
                    .isActive = true
            }
            storyNameLabel.topAnchor.constraint(equalTo: storyImageView.bottomAnchor, constant: 4).isActive = true
            storyNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14).isActive = true
            storyNameLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
            storyNameLabel.centerXAnchor.constraint(equalTo: storyImageView.centerXAnchor).isActive = true

            offset = storyImageView.trailingAnchor
        }
    }
}
