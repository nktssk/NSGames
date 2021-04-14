//
//  CreateAdCoordinator.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 13.04.2021.
//

import UIKit

protocol CreateAdCoordinatorProtocol: Coordinator, SelectGameCoordinatorProtocol {
    func goToSelectGamesView()
    func goToSelectGamesView(games: [Int])
}

class CreateAdCoordinator: CreateAdCoordinatorProtocol {

    let navigationController = UINavigationController()

    func getStartViewController() -> UIViewController {
        let controller = CreateAdViewController()
        controller.viewModel = CreateAdViewModel(service: MockGameService(), coordinator: self)
        navigationController.pushViewController(controller, animated: false)
        return navigationController
    }

    func goToSelectGamesView() {
        let controller = SelectGamesViewContoller()
        controller.viewModel = SelectGamesViewModel(service: MockSelectGamesService(), coordinator: self, id: nil)
        navigationController.pushViewController(controller, animated: true)
    }

    func goToSelectGamesView(games: [Int]) {
        let controller = SelectGamesViewContoller()
        controller.viewModel = SelectGamesViewModel(service: MockSelectGamesService(), coordinator: self, id: nil)
        controller.viewModel?.selected = games
        navigationController.pushViewController(controller, animated: true)
    }

    func choosen(games: [Int]) {
        navigationController.popViewController(animated: true)
        if let viewModel = (navigationController.visibleViewController as? CreateAdViewController)?.viewModel {
            viewModel.selectedGames.value = games
        }
    }
}
