//
//  HomeCoordinator.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import UIKit

protocol AdsCoordinatorProtocol: Coordinator, SelectGameCoordinatorProtocol {
    func getStartViewController() -> UIViewController
    func goToDetailView(id: Int)
    func goToOfferView(id: Int)
    func goToSelectGamesView(id: Int)
    func goToChat(messageId: String, username: String)
}

protocol SelectGameCoordinatorProtocol {
    func choosen(games: [Int])
}

class AdCoordinator: AdsCoordinatorProtocol {
    func choosen(games: [Int]) {
        // TO DO: - Logic
    }

    let navigationController = UINavigationController()

    init() {
        let homeScreen = HomeScreenViewController()
        homeScreen.viewModel = MockHomeScreenViewModel(service: HomeScreenService(), coordinator: self)
        navigationController.pushViewController(homeScreen, animated: true)
    }

    func getStartViewController() -> UIViewController {
        return navigationController
    }

    func goToDetailView(id: Int) {
        let controller = GameViewController()
        controller.viewModel = MockGameViewModel(service: GameService(), coordinator: self, id: id)
        navigationController.pushViewController(controller, animated: true)
    }

    func goToOfferView(id: Int) {
        let controller = OfferViewController()
        controller.viewModel = MockOfferViewModel(service: MockOfferService(), coordinator: self, id: id)
        navigationController.pushViewController(controller, animated: true)
    }

    func goToSelectGamesView(id: Int) {
        let controller = SelectGamesViewContoller()
        controller.viewModel = SelectGamesViewModel(service: SelectGamesService(), coordinator: self, id: id)
        navigationController.pushViewController(controller, animated: true)
    }

    func goToChat(messageId: String, username: String) {
        let controller = ChatViewController()
        ChatFireBaseService.shared.otherUserName = username
        controller.viewModel = ChatViewModel(service: ChatFireBaseService.shared, id: messageId, title: username)
        navigationController.pushViewController(controller, animated: true)
    }
}
