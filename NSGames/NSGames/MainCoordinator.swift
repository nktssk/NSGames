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
        if !isAuthorized() {
            let coordinator = AuthenticationCoordinator()
            coordinator.mainCoordinator = self
            window.backgroundColor = .white
            window.makeKeyAndVisible()
            window.rootViewController = coordinator.start()
        } else {
        }
    }

    func authFinished() {
        window.rootViewController = TabBarCoordinator().start()
    }

    private func isAuthorized() -> Bool {
        #warning("Check token")
        return false
    }
}