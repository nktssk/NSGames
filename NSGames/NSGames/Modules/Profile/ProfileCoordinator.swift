//
//  ProfileCoordinator.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.04.2021.
//

import UIKit

protocol ProfileCoordinatorProtocol: Coordinator {
    func goToDetailOfferView(id: Int, name: String)
    func goToChat(messageId: String, username: String)
    func goToAuth()
    func goToTradeList(id: Int)
}

class ProfileCoordinator: ProfileCoordinatorProtocol {
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
        ChatFireBaseService.shared.otherUserName = username
        controller.viewModel = ChatViewModel(service: ChatFireBaseService.shared, id: messageId, title: username)
        navigationController.pushViewController(controller, animated: true)
    }

    func goToAuth() {
        KeychainService.deleteAll()
        mainCoordinator?.start()
    }

    func goToTradeList(id: Int) {
        let controller = SelectGamesViewContoller()
        let viewModel = SelectGamesViewModel(service: SelectGamesService(), coordinator: AdCoordinator(), id: id)
        viewModel.offerId = id
        controller.viewModel = viewModel
        navigationController.pushViewController(controller, animated: true)
    }
}
