// PostCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомная ячейка для постов
class PostCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let manImageName = "man"
        static let avatarLabelText = "tur_v_dagestan"
        static let someImageName = "image1"
        static let anotherImageName = "image2"
        static let ellipsImageName = "ellipsis"
        static let heartImageName = "heart"
        static let messageImageName = "message-circle"
        static let paperPlaneImageName = "paperplane"
        static let bookmarkImageName = "bookmark"
        static let likeCountLabelText = "Нравится 201"
        static let commentLabelText = "Комментировать ..."
        static let passedTimeLabelText = "10 минут назад"
        static let decriptionLabelText =
            "Насладитесь красотой природы. Забронировать \nтур в Дагестан можно уже сейчас!"
    }

    static let identifier = "PostCell"

    // MARK: - Visual Components

    private let scrollView = UIScrollView()
    private let pageControl = UIPageControl()

    private var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.manImageName)
        return imageView
    }()

    private var avatarLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.avatarLabelText
        label.font = UIFont(name: MainTabBarController.Constants.verdanaBold, size: 12)
        label.textAlignment = .left
        return label
    }()

    private var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.someImageName)
        return imageView
    }()

    private var seondMainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.anotherImageName)
        return imageView
    }()

    private var optionsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.ellipsImageName)
        return imageView
    }()

    private var likeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.heartImageName)
        return imageView
    }()

    private var commentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.messageImageName)
        return imageView
    }()

    private var shareImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.paperPlaneImageName)
        return imageView
    }()

    private var bookmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.bookmarkImageName)
        return imageView
    }()

    private var likeLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.likeCountLabelText
        label.font = UIFont(name: MainTabBarController.Constants.verdanaBold, size: 10)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    private var otherCommentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: MainTabBarController.Constants.verdana, size: 10)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()

    private var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: FeedViewController.Constants.myStoryImage)
        return imageView
    }()

    private var myCommentLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.commentLabelText
        label.font = UIFont(name: MainTabBarController.Constants.verdana, size: 10)
        label.textAlignment = .left
        label.textColor = .lightGray
        return label
    }()

    private var lastCommentTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.passedTimeLabelText
        label.font = UIFont(name: MainTabBarController.Constants.verdana, size: 10)
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
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
        scrollView.delegate = self
        contentView.addSubview(scrollView)
        scrollView.addSubview(mainImageView)
        scrollView.addSubview(seondMainImageView)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(avatarLabel)
        contentView.addSubview(optionsImageView)
        contentView.addSubview(likeImageView)
        contentView.addSubview(commentImageView)
        contentView.addSubview(shareImageView)
        contentView.addSubview(bookmarkImageView)
        contentView.addSubview(likeLabel)
        contentView.addSubview(otherCommentLabel)
        contentView.addSubview(myImageView)
        contentView.addSubview(myCommentLabel)
        contentView.addSubview(lastCommentTimeLabel)
        contentView.addSubview(pageControl)
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.backgroundStyle = .automatic
        pageControl.numberOfPages = 2
        scrollView.isPagingEnabled = true
        avatarImageView.layer.cornerRadius = 15
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        myImageView.layer.cornerRadius = 10
        myImageView.contentMode = .scaleAspectFill
        myImageView.clipsToBounds = true
        optionsImageView.tintColor = .black
        likeImageView.tintColor = .black
        likeImageView.contentMode = .scaleAspectFill
        commentImageView.tintColor = .black
        commentImageView.contentMode = .scaleAspectFill
        shareImageView.tintColor = .black
        shareImageView.contentMode = .scaleAspectFill
        bookmarkImageView.tintColor = .black
        bookmarkImageView.contentMode = .scaleAspectFill
        let attributedString = NSMutableAttributedString(
            string: "\(Constants.avatarLabelText) ",
            attributes: [NSAttributedString.Key.font: UIFont(
                name: MainTabBarController.Constants.verdanaBold,
                size: 10
            ) ?? ""]
        )
        let regString = NSAttributedString(
            string: Constants.decriptionLabelText,
            attributes: [
                NSAttributedString.Key
                    .font: UIFont(name: MainTabBarController.Constants.verdana, size: 10) ?? ""
            ]
        )
        attributedString.append(regString)
        otherCommentLabel.attributedText = attributedString
        scrollView.showsHorizontalScrollIndicator = false
    }

    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarLabel.translatesAutoresizingMaskIntoConstraints = false
        optionsImageView.translatesAutoresizingMaskIntoConstraints = false
        likeImageView.translatesAutoresizingMaskIntoConstraints = false
        commentImageView.translatesAutoresizingMaskIntoConstraints = false
        shareImageView.translatesAutoresizingMaskIntoConstraints = false
        bookmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        otherCommentLabel.translatesAutoresizingMaskIntoConstraints = false
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myCommentLabel.translatesAutoresizingMaskIntoConstraints = false
        lastCommentTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        seondMainImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 239),
            mainImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainImageView.widthAnchor.constraint(equalToConstant: 375),
            mainImageView.heightAnchor.constraint(equalToConstant: 239),
            seondMainImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            seondMainImageView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor),
            seondMainImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            seondMainImageView.widthAnchor.constraint(equalToConstant: 375),
            seondMainImageView.heightAnchor.constraint(equalToConstant: 239),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            avatarImageView.widthAnchor.constraint(equalToConstant: 30),
            avatarImageView.heightAnchor.constraint(equalToConstant: 30),
            avatarLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6),
            avatarLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            optionsImageView.centerYAnchor.constraint(equalTo: avatarLabel.centerYAnchor),
            optionsImageView.leadingAnchor.constraint(equalTo: avatarLabel.trailingAnchor, constant: 187),
            likeImageView.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            likeImageView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 12),
            likeImageView.widthAnchor.constraint(equalToConstant: 24),
            likeImageView.heightAnchor.constraint(equalToConstant: 24),
            commentImageView.leadingAnchor.constraint(equalTo: likeImageView.trailingAnchor, constant: 8),
            commentImageView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 12),
            commentImageView.widthAnchor.constraint(equalToConstant: 24),
            commentImageView.heightAnchor.constraint(equalToConstant: 24),
            shareImageView.leadingAnchor.constraint(equalTo: commentImageView.trailingAnchor, constant: 8),
            shareImageView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 12),
            shareImageView.widthAnchor.constraint(equalToConstant: 24),
            shareImageView.heightAnchor.constraint(equalToConstant: 24),
            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 8),
            pageControl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            bookmarkImageView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 12),
            bookmarkImageView.trailingAnchor.constraint(equalTo: optionsImageView.trailingAnchor),
            bookmarkImageView.widthAnchor.constraint(equalToConstant: 24),
            bookmarkImageView.heightAnchor.constraint(equalToConstant: 24),
            likeLabel.leadingAnchor.constraint(equalTo: likeImageView.leadingAnchor),
            likeLabel.topAnchor.constraint(equalTo: likeImageView.bottomAnchor, constant: 6),
            likeLabel.heightAnchor.constraint(equalToConstant: 15),
            likeLabel.widthAnchor.constraint(equalToConstant: 107),
            otherCommentLabel.leadingAnchor.constraint(equalTo: likeLabel.leadingAnchor),
            otherCommentLabel.topAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: 6),
            otherCommentLabel.widthAnchor.constraint(equalToConstant: 361),
            otherCommentLabel.heightAnchor.constraint(equalToConstant: 30),
            myImageView.leadingAnchor.constraint(equalTo: likeLabel.leadingAnchor),
            myImageView.topAnchor.constraint(equalTo: otherCommentLabel.bottomAnchor, constant: 4),
            myImageView.widthAnchor.constraint(equalToConstant: 20),
            myImageView.heightAnchor.constraint(equalToConstant: 20),
            myCommentLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 3),
            myCommentLabel.topAnchor.constraint(equalTo: otherCommentLabel.bottomAnchor, constant: 6),
            myCommentLabel.widthAnchor.constraint(equalToConstant: 150),
            myCommentLabel.heightAnchor.constraint(equalToConstant: 15),
            lastCommentTimeLabel.leadingAnchor.constraint(equalTo: likeLabel.leadingAnchor),
            lastCommentTimeLabel.topAnchor.constraint(equalTo: myCommentLabel.bottomAnchor, constant: 7),
            lastCommentTimeLabel.widthAnchor.constraint(equalToConstant: 150),
            lastCommentTimeLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
}

// MARK: - PostCell + UIScrollViewDelegate

extension PostCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}
