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

    private let coordinator: AdsCoordinatorProtocol
    private let service: OfferServiceProtocol
    private let id: Int

    init(service: OfferServiceProtocol, coordinator: AdsCoordinatorProtocol, id: Int) {
        self.service = service
        self.coordinator = coordinator
        self.id = id
    }

    func selectGames(id: Int) {
        coordinator.goToSelectGamesView(id: id)
    }
}
