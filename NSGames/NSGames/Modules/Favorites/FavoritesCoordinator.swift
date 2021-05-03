//
//  FavoritesCoordinator.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 13.04.2021.
//

import UIKit

class FavoritesCoordinator: AdsCoordinatorProtocol {
    func choosen(games: [Int]) {
        navigationController.popViewController(animated: true)
        guard let controller = navigationController.topViewController as? OfferViewController else { fatalError() }
        controller.viewModel?.selectedGames.value = games
    }

    let navigationController = UINavigationController()

    init() {
        let homeScreen = HomeScreenViewController()
        homeScreen.style = .favorites
        homeScreen.viewModel = MockHomeScreenViewModel(service: FavoritesService(), coordinator: self)
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
        controller.viewModel = MockOfferViewModel(service: OfferService(), coordinator: self, id: id)
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
