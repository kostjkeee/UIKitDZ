// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с уведомлениями
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let navigationTitle = "Уведомления"
        static let blankCellIdentifier = "someCell"
    }

    // MARK: - Visual Components

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SubscriptionCell.self, forCellReuseIdentifier: SubscriptionCell.identifier)
        tableView.register(LikedCommentCell.self, forCellReuseIdentifier: LikedCommentCell.identifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "someCell")
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        return tableView
    }()

    // MARK: - Private Properties

    private let notification = NotificationStorage()
    private let sectionsType: [NotificationSectionsTypes] = [.blank, .today, .thisWeek]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = Constants.navigationTitle
        navigationController?.navigationBar.prefersLargeTitles = true
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
}

// MARK: - NotificationsViewController + UITableViewDelegate

extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let containerView = UIView()
        let label = UILabel()
        label.text = sectionsType[section].rawValue
        label.font = UIFont(name: MainTabBarController.Constants.verdanaBold, size: 14)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(label)
        label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        if section == 0 {
            label.font = UIFont(name: MainTabBarController.Constants.verdana, size: 14)
            return containerView
        }
        label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -18).isActive = true
        return containerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        UITableView.automaticDimension
        47
    }
}

// MARK: - NotificationsViewController + UITableViewDataSource

extension NotificationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionsType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sectionsType[section] {
        case .blank:
            return 0
        case .today:
            return notification.likeNotifications.count
        case .thisWeek:
            return notification.recommendNotifications.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = sectionsType[indexPath.section]
        switch cellType {
        case .blank:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.blankCellIdentifier, for: indexPath)
            return cell
        case .today:
            let cellData = notification.likeNotifications[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: LikedCommentCell.identifier,
                for: indexPath
            ) as? LikedCommentCell
            else { return UITableViewCell() }
            cell.configureCell(
                avatarImageName: cellData.avatarImageName,
                userName: cellData.username,
                activityType: cellData.activityTypeText,
                commentText: cellData.commentText,
                passedTime: cellData.passedTimeText,
                likedImageName: cellData.likedImageName,
                shouldAddRespond: cellData.shouldAddRespond
            )
            return cell
        case .thisWeek:
            let cellData = notification.recommendNotifications[indexPath.row]

            if let likeNotification = cellData as? LikeNotification {
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: LikedCommentCell.identifier,
                    for: indexPath
                ) as? LikedCommentCell
                else { return UITableViewCell() }
                cell.configureCell(
                    avatarImageName: likeNotification.avatarImageName,
                    userName: likeNotification.username,
                    activityType: likeNotification.activityTypeText,
                    commentText: likeNotification.commentText,
                    passedTime: likeNotification.passedTimeText,
                    likedImageName: likeNotification.likedImageName,
                    shouldAddRespond: likeNotification.shouldAddRespond
                )
                return cell

            } else if let subscriptionNotification = cellData as? RecommendNotification {
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SubscriptionCell.identifier,
                    for: indexPath
                ) as? SubscriptionCell
                else { return UITableViewCell() }

                cell.configureCell(
                    avatarImageName: subscriptionNotification.avatarImageName,
                    userName: subscriptionNotification.username,
                    activityType: subscriptionNotification.activityText,
                    passedTime: subscriptionNotification.passedTimeText,
                    didUserSubscribe: subscriptionNotification.didUserSubscribed
                )
                return cell
            }
            return UITableViewCell()
        }
    }
}
