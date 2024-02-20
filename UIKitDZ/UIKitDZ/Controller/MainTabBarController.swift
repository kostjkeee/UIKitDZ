// MainTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Инициализирует  все контроллеры для таб бара
class MainTabBarController: UITabBarController {
    enum Constants {
        static let feedTabBarName = "Лента"
        static let notificationsTabBarName = "Уведомления"
        static let profileTabBarName = "Профиль"
        static let feedTabBarImage = "house"
        static let notificationsTabBarImage = "message.badge"
        static let profileTabBarImage = "person"
        static let blueColor = "myBlue"
        static let verdana = "Verdana"
        static let verdanaBold = "Verdana-Bold"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBars()
        customizeTabBars()
        makeTabBarLine()
    }

    // MARK: - Private Methods

    private func makeTabBarLine() {
        let lineView = UIView()
        lineView.backgroundColor = .lightGray
        tabBar.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.leftAnchor.constraint(equalTo: tabBar.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: tabBar.rightAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }

    private func customizeTabBars() {
        tabBar.tintColor = UIColor(named: Constants.blueColor)
        tabBar.unselectedItemTintColor = .black
    }

    private func generateTabBars() {
        viewControllers = [
            UINavigationController(
                rootViewController: makeViewControllers(
                    viewController: FeedViewController(),
                    title: Constants.feedTabBarName,
                    image: UIImage(systemName: Constants.feedTabBarImage)
                )
            ),
            UINavigationController(
                rootViewController: makeViewControllers(
                    viewController: NotificationsViewController(),
                    title: Constants.notificationsTabBarName,
                    image: UIImage(systemName: Constants.notificationsTabBarImage)
                )
            ),
            UINavigationController(
                rootViewController: makeViewControllers(
                    viewController: ProfileViewController(),
                    title: Constants.profileTabBarName,
                    image: UIImage(systemName: Constants.profileTabBarImage)
                )
            )
        ]
    }

    private func makeViewControllers(
        viewController: UIViewController,
        title: String,
        image: UIImage?
    ) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
