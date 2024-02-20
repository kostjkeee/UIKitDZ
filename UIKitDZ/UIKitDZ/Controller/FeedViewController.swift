// FeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран со всем медиа контентом
class FeedViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let appLogoName = "RMLink"
        static let messageButtonName = "messageImage"
        static let storyImageName = "storyImage"
        static let myStoryImage = "avatarImage2"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBarButtons()
        setupUI()
    }

    // MARK: - Visual Components

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RecommendCell.self, forCellReuseIdentifier: RecommendCell.identifier)
        return tableView
    }()

    // MARK: - Private Methods

    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.estimatedRowHeight = UITableView.automaticDimension
//        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
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

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        } else {
            return 75
        }
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RecommendCell.identifier,
            for: indexPath
        ) as? RecommendCell
        else { fatalError() }

        return cell
    }
}
