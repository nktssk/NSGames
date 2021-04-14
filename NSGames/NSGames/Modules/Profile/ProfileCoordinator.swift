//
//  ProfileCoordinator.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.04.2021.
//

import UIKit

class ProfileCoordinator: Coordinator {
    let navigationController = UINavigationController()
    var mainCoordinator: MainCoordinator?

    init() {
        let controller = ProfileViewController()
        controller.viewModel = ProfileViewModel(service: ProfileViewService(), coordinator: self)
        navigationController.pushViewController(controller, animated: true)
    }

    func getStartViewController() -> UIViewController {
        return navigationController
    }

    func goToDetailOfferView(id: Int, name: String) {
        let controller = DetailOfferViewConroller()
        controller.viewModel = DetailViewModel(service: DetailOfferViewService(), coordinator: self, id: id, title: name)
        navigationController.pushViewController(controller, animated: true)
    }

    func goToChat(messageId: String, username: String) {
        let controller = ChatViewController()
        controller.viewModel = ChatViewModel(service: ChatFireBaseService.shared, id: messageId, title: username)
        navigationController.pushViewController(controller, animated: true)
    }

    func showTradeList(id: Int) {
        let controller = SelectGamesViewContoller()
        controller.viewModel = SelectGamesViewModel(service: MockSelectGamesService(), coordinator: AdCoordinator(), id: id)
        navigationController.pushViewController(controller, animated: true)
    }
}
