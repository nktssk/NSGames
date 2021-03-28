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
        if !isAuthorized() {
            let coordinator = AuthenticationCoordinator()
            coordinator.mainCoordinator = self
            window.backgroundColor = .white
            window.rootViewController = coordinator.getFirstViewController()
        } else {
        }
    }

    func authFinished() {
        let tabBarCoordinator = TabBarCoordinator()
        window.rootViewController = tabBarCoordinator.getFirstViewController()
    }

    private func isAuthorized() -> Bool {
        // TODO: Check token
        return false
    }
}
