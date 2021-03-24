//
//  HomeCoordinator.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import UIKit

class HomeCoordinator {
    let navigationController = UINavigationController()

    func start() -> UIViewController {
        let homeScreen = HomeScreenViewController()
        homeScreen.viewModel = MockHomeScreenViewModel(service: MockHomeScreenService(), coordinator: self)
        navigationController.pushViewController(homeScreen, animated: true)
        return navigationController
    }

    func detailView(id: Int) {
        let controller = GameViewController()
        controller.viewModel = MockGameViewModel(service: MockHomeScreenService(), coordinator: self)
        navigationController.pushViewController(controller, animated: true)
    }

    func makeOffer(id: Int) {
        let controller = OfferViewController()
        controller.viewModel = MockOfferViewModel(service: MockOfferService(), coordinator: self)
        navigationController.pushViewController(controller, animated: true)
    }

    func selectGames(id: Int) {
        let controller = SelectGamesViewContoller()
        navigationController.pushViewController(controller, animated: true)
    }
}
