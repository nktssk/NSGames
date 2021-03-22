//
//  HomeScreenViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import Foundation

protocol HomeScreenViewModel {
    func getData(completion: @escaping (Result<[HomeScreenCellConfig], Error>) -> Void)

    func likeAd(id: Int)
}

class MockHomeScreenViewModel: HomeScreenViewModel {

    private let queue = DispatchQueue.global(qos: .background)
    private let service: HomeScreenService

    init(service: HomeScreenService) {
        self.service = service
    }

    func getData(completion: @escaping (Result<[HomeScreenCellConfig], Error>) -> Void) {
        queue.async { [weak self] in
            sleep(5)
            self?.service.getData { result in
                DispatchQueue.main.async { completion(result) }
            }
        }
    }

    func likeAd(id: Int) {
        service.likeAd(id: id)
    }
}
