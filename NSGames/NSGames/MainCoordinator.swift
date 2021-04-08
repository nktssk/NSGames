//
//  MainCoordinator.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import UIKit

class MainCoordinator {
    private let window = UIWindow()

    func start() {
        window.makeKeyAndVisible()
        window.backgroundColor = .white
        if KeychainService.getToken() != nil {
            goToTabBar()
        } else {
            let coordinator = AuthenticationCoordinator()
            coordinator.mainCoordinator = self
            window.rootViewController = coordinator.getStartViewController()
        }
    }

    func goToTabBar() {
        window.rootViewController = AppTabBarController()
    }
}
