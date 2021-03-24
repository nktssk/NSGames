//
//  HomeScreenViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import Foundation

protocol GameViewModel {
    func getData(id: Int, completion: @escaping (Result<[HomeScreenCellConfig], Error>) -> Void)
    func makeOffer(id: Int)
}

class MockGameViewModel: GameViewModel {

    private let queue = DispatchQueue.global(qos: .background)
    private let service: HomeScreenService
    private let coordinator: HomeCoordinator

    init(service: HomeScreenService, coordinator: HomeCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }

    func getData(id: Int, completion: @escaping (Result<[HomeScreenCellConfig], Error>) -> Void) {
        queue.async { [weak self] in
            sleep(5)
            self?.service.getData { result in
                DispatchQueue.main.async { completion(result) }
            }
        }
    }

    func makeOffer(id: Int) {
        coordinator.makeOffer(id: id)
    }
}
