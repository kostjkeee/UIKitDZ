// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// scene delegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        let menuVC = MenuViewController()
        let authVC = AuthorizationViewController()
        authVC.modalPresentationStyle = .fullScreen

        let navigationController = UINavigationController(rootViewController: menuVC)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()

        navigationController.present(authVC, animated: true)
    }
}
