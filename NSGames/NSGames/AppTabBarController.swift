//
//  AppTabBarController.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import UIKit

class AppTabBarController: UITabBarController {

    let adCoordinator = AdCoordinator()
    let chatCoordinator = ChatCoordinator()
    let profileCoordinator = ProfileCoordinator()
    let favoritesCoordinator = FavoritesCoordinator()
    let createAdCoordinator = CreateAdCoordinator()

    init() {
        super.init(nibName: nil, bundle: nil)
        let homeController = adCoordinator.getStartViewController()
        homeController.tabBarItem = UITabBarItem(title: "Главная",
                                                 image: UIImage(named: "house.fill"),
                                                 tag: 0)

        let chatController = chatCoordinator.getStartViewController()
        chatController.tabBarItem = UITabBarItem(title: "Чат",
                                                 image: UIImage(named: "paperplane.fill"),
                                                 tag: 0)

        let profileController = profileCoordinator.getStartViewController()
        profileController.tabBarItem = UITabBarItem(title: "Профиль",
                                                    image: UIImage(named: "person.crop.circle.fill"),
                                                    tag: 0)

        let favoritesController = favoritesCoordinator.getStartViewController()
        favoritesController.tabBarItem = UITabBarItem(title: "Избранное",
                                                      image: UIImage(named: "star.fill"),
                                                      tag: 0)

        let createAdController = createAdCoordinator.getStartViewController()
        createAdController.tabBarItem = UITabBarItem(title: "Создать",
                                                     image: UIImage(named: "plus.app.fill"),
                                                     tag: 0)

        self.viewControllers = [homeController, favoritesController, createAdController, chatController, profileController]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
