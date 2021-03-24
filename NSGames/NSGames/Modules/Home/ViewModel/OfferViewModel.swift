//
//  OfferViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import Foundation

protocol OfferViewModel {
    func selectGames(id: Int)
}

class MockOfferViewModel: OfferViewModel {
    let coordinator: HomeCoordinator
    let service: OfferService

    init(service: OfferService, coordinator: HomeCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }

    func selectGames(id: Int) {
        coordinator.selectGames(id: id)
    }
}
