//
//  TapBarCoordinator.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import UIKit

class TabBarCoordinator {

    func start() -> UIViewController {
        let tabBarController = UITabBarController()
        let homeCoordinator = HomeCoordinator()
        tabBarController.viewControllers = [homeCoordinator.start()]
        return tabBarController
    }
}
