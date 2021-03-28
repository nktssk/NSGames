//
//  TapBarCoordinator.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import UIKit

class TabBarCoordinator: Coordinator {
    let tabBarController = UITabBarController()
    let homeCoordinator = HomeCoordinator()
    let chatCoordinator = ChatCoordinator()

    func getFirstViewController() -> UIViewController {
        let homeController = homeCoordinator.getFirstViewController()
        homeController.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "house.fill"), tag: 0)
        let chatController = chatCoordinator.getFirstViewController()
        chatController.tabBarItem = UITabBarItem(title: "Чат", image: UIImage(named: "paperplane.fill"), tag: 0)
        tabBarController.viewControllers = [homeController, chatController]
        return tabBarController
    }
}
