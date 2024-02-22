// FeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран со всем медиа контентом
final class FeedViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let appLogoName = "RMLink"
        static let messageButtonName = "messageImage"
        static let storyImageName = "storyImage"
        static let myStoryImage = "avatarImage2"
    }

    // MARK: - Visual Components

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(StoryCell.self, forCellReuseIdentifier: StoryCell.identifier)
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.identifier)
        tableView.register(RecommendCell.self, forCellReuseIdentifier: RecommendCell.identifier)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Private Properties

    private let contentType: [FeedCellTypes] = [.story, .firstPost, .recommendation, .otherPosts]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBarButtons()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupNavigationBarButtons() {
        let leftBarButton = UIBarButtonItem(
            image: UIImage(named: Constants.appLogoName),
            style: .plain,
            target: nil,
            action: nil
        )
        let rightBarButton = UIBarButtonItem(
            image: UIImage(named: Constants.messageButtonName),
            style: .plain,
            target: nil,
            action: nil
        )
        leftBarButton.tintColor = .black
        rightBarButton.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton
    }
}

// MARK: - FeedViewContoller + UITableViewDelegate

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch contentType[indexPath.section] {
        case .story:
            return 100
        case .firstPost:
            return 450
        case .recommendation:
            return 270
        case .otherPosts:
            return 450
        }
    }
}

// MARK: - FeedViewController + UITableViewDataSource

extension FeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        contentType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch contentType[section] {
        case .story, .recommendation, .firstPost:
            return 1
        case .otherPosts:
            return 5
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch contentType[indexPath.section] {
        case .story:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StoryCell.identifier,
                for: indexPath
            ) as? StoryCell
            else { return UITableViewCell() }
            return cell
        case .firstPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PostCell.identifier,
                for: indexPath
            ) as? PostCell
            else { return UITableViewCell() }
            return cell
        case .recommendation:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecommendCell.identifier,
                for: indexPath
            ) as? RecommendCell
            else { return UITableViewCell() }
            return cell
        case .otherPosts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PostCell.identifier,
                for: indexPath
            ) as? PostCell
            else { return UITableViewCell() }
            return cell
        }
    }
}
