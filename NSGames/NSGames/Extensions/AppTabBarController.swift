//
//  AppTabBarController.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import UIKit

class AppTabBarController: UITabBarController {

    init() {
        super.init(nibName: nil, bundle: nil)
        let homeCoordinator = HomeCoordinator()
        let chatCoordinator = ChatCoordinator()
        let homeController = homeCoordinator.getStartViewController()
        homeController.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "house.fill"), tag: 0)
        let chatController = chatCoordinator.getStartViewController()
        chatController.tabBarItem = UITabBarItem(title: "Чат", image: UIImage(named: "paperplane.fill"), tag: 0)
        self.viewControllers = [homeController, chatController]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
