//
//  HomeScreenViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import UIKit

protocol GameViewModelProtocol {
    var imageItems: Observable<[UIImage]> { get set }
    var gameSreenConfig: Observable<GameSreenConfig?> { get set }

    func getData()
    func makeOffer()
    func goToChat()
}

class MockGameViewModel: GameViewModelProtocol {

    // MARK: - Properties
    var imageItems: Observable<[UIImage]> = Observable([])
    var gameSreenConfig: Observable<GameSreenConfig?> = Observable(nil)

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
                self?.gameSreenConfig.value = config

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

    func goToChat() {
        if let data = gameSreenConfig.value {
            coordinator.goToChat(messageId: data.messageId, username: data.profile.username)
        }
    }
}
