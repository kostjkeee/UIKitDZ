// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Профиль
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let navigationLeftUserName = "mary_rmLink"
        static let navigationLeftlockImageName = "lock"
        static let navigationRightPlusImageName = "plus.app"
        static let navigationRightSettingsImageName = "line.3.horizontal"
    }

    // MARK: - Visual Components

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UserInfoTableCell.self, forCellReuseIdentifier: UserInfoTableCell.identifier)
        tableView.register(StoriesTableCell.self, forCellReuseIdentifier: StoriesTableCell.identifier)
        tableView.register(SpaceImagesTableCell.self, forCellReuseIdentifier: SpaceImagesTableCell.identifier)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        return tableView
    }()

    // MARK: - Private Properties

    private let sectionsType: [ProfileCellTypes] = [.userInfo, .stories, .spaceImages]

    private let profileStorage = ProfileStorage()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupNavigationBarButtons()
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setupNavigationBarButtons() {
        let leftBarUsernameButton = UIBarButtonItem(
            title: Constants.navigationLeftUserName,
            style: .plain,
            target: nil,
            action: nil
        )
        let leftBarLockButton = UIBarButtonItem(
            image: UIImage(systemName: Constants.navigationLeftlockImageName),
            style: .plain,
            target: nil,
            action: nil
        )
        let rightBarPlusButton = UIBarButtonItem(
            image: UIImage(systemName: Constants.navigationRightPlusImageName),
            style: .plain,
            target: nil,
            action: nil
        )
        let rightBarSettingsButton = UIBarButtonItem(
            image: UIImage(systemName: Constants.navigationRightSettingsImageName),
            style: .plain,
            target: nil,
            action: nil
        )

        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = -100

        leftBarLockButton.tintColor = .black
        leftBarUsernameButton.tintColor = .black
        rightBarPlusButton.tintColor = .black
        rightBarSettingsButton.tintColor = .black
        leftBarUsernameButton.setTitleTextAttributes(
            [
                NSAttributedString.Key
                    .font: UIFont(name: MainTabBarController.Constants.verdanaBold, size: 18) ?? UIFont
                    .systemFont(ofSize: 18)
            ],
            for: .normal
        )
        navigationItem.leftBarButtonItems = [leftBarLockButton, leftBarUsernameButton, spacer]
        navigationItem.rightBarButtonItems = [rightBarSettingsButton, rightBarPlusButton]
    }
}

// MARK: - ProfileViewController + UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {}

// MARK: - ProfileViewController + UITableViewDelegate

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionsType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = sectionsType[indexPath.section]
        switch cellType {
        case .userInfo:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: UserInfoTableCell.identifier, for: indexPath) as? UserInfoTableCell
            else { return UITableViewCell() }
            cell.configure(userInfo: profileStorage.userInfo)
            cell.presentWkWebViewHandler = { url in
                print(url)
                let destination = WkWebViewController()
                destination.urlString = url
                self.present(destination, animated: true)
            }
            return cell
        case .stories:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: StoriesTableCell.identifier, for: indexPath) as? StoriesTableCell
            else { return UITableViewCell() }
            cell.configure(stories: profileStorage.stories)
            return cell
        case .spaceImages:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: SpaceImagesTableCell.identifier,
                    for: indexPath
                ) as? SpaceImagesTableCell
            else { return UITableViewCell() }
            cell.loadSpaceImagesNames(imagesNames: profileStorage.spaceImagesNames)
            return cell
        }
    }
}
