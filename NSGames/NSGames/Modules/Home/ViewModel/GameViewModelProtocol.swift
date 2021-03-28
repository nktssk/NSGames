//
//  HomeScreenViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import UIKit

protocol GameViewModelProtocol {
    var imageItems: Observable<[UIImage]> { get set }
    var game: Observable<GameConfig?> { get set }

    func getData()
    func makeOffer()
}

class MockGameViewModel: GameViewModelProtocol {

    // MARK: - Properties
    var imageItems: Observable<[UIImage]> = Observable([])
    var game: Observable<GameConfig?> = Observable(nil)

    private let id: Int
    private let service: GameServiceProtocol
    private let coordinator: HomeCoordinator

    init(service: GameServiceProtocol, coordinator: HomeCoordinator, id: Int) {
        self.service = service
        self.coordinator = coordinator
        self.id = id
    }

    func getData() {
        // TODO: request
        service.getStringData(id: id) { [weak self] result in
            switch result {
            case .success(let config):
                self?.game.value = config

            case .failure:
                // TODO: -error
                print("error")
            }
        }

        service.getImages(id: id) { [weak self] result in
            switch result {
            case .success(let images):
                self?.imageItems.value = images

            case .failure:
                // TODO: -error
                print("error")
            }
        }
    }

    func makeOffer() {
        coordinator.goToOfferView(id: id)
    }
}
