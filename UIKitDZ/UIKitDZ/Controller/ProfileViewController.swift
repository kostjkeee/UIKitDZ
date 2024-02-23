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
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    private func setupNavigationBarButtons() {
        let leftBarUsernameButton = makeBarButtonItem(text: Constants.navigationLeftUserName)
        let leftBarLockButton = makeBarButtonItem(image: UIImage(systemName: Constants.navigationLeftlockImageName))
        let rightBarPlusButton = makeBarButtonItem(image: UIImage(systemName: Constants.navigationRightPlusImageName))
        let rightBarSettingsButton =
            makeBarButtonItem(image: UIImage(systemName: Constants.navigationRightSettingsImageName))
        navigationItem.setLeftBarButtonItems([leftBarLockButton, leftBarUsernameButton], animated: false)
        navigationItem.setRightBarButtonItems([rightBarSettingsButton, rightBarPlusButton], animated: false)
    }

    private func makeBarButtonItem(image: UIImage? = nil, text: String? = nil) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont(name: MainTabBarController.Constants.verdanaBold, size: 18)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        if text == nil {
            button.widthAnchor.constraint(equalToConstant: 24).isActive = true
            button.contentMode = .scaleAspectFill
        }
        return UIBarButtonItem(customView: button)
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
            cell.passingInfoToControllerHandler = { [weak self] fullImageName, miniImageName, text in
                let destination = StoryPresentationViewController()
                destination.fullImageNameToShow = fullImageName
                destination.miniImageNameToShow = miniImageName
                destination.storyTextToShow = text
                self?.present(destination, animated: true)
            }
            return cell
        case .spaceImages:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: SpaceImagesTableCell.identifier,
                    for: indexPath
                ) as? SpaceImagesTableCell
            else { return UITableViewCell() }
            cell.configure(imagesNames: profileStorage.spaceImagesNames)
            return cell
        }
    }
}
