//
//  OfferViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import Foundation

protocol OfferViewModelProtocol {
    var selectedGames: Observable<[Int]> { get set }

    func selectGames()
    func sendOffer(description: String, price: Double?)
}

class MockOfferViewModel: OfferViewModelProtocol {
    var selectedGames: Observable<[Int]> = Observable([])

    private let coordinator: AdsCoordinatorProtocol
    private let service: OfferServiceProtocol
    private let id: Int

    init(service: OfferServiceProtocol, coordinator: AdsCoordinatorProtocol, id: Int) {
        self.service = service
        self.coordinator = coordinator
        self.id = id
    }

    func selectGames() {
        coordinator.goToSelectGamesView(id: id)
    }

    func sendOffer(description: String, price: Double?) {
        service.sendOffer(offer: OfferDto(adId: id, price: price, tradeList: selectedGames.value, description: description)) { result in
            print("done")
        }
    }
}
