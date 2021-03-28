//
//  OfferViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import Foundation

protocol OfferViewModelProtocol {
    func selectGames(id: Int)
}

class MockOfferViewModel: OfferViewModelProtocol {

    private let coordinator: HomeCoordinator
    private let service: OfferServiceProtocol
    private let id: Int

    init(service: OfferServiceProtocol, coordinator: HomeCoordinator, id: Int) {
        self.service = service
        self.coordinator = coordinator
        self.id = id
    }

    func selectGames(id: Int) {
        coordinator.goToSelectGamesView(id: id)
    }
}
