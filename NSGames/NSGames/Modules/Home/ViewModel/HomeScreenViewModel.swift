//
//  HomeScreenViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import Foundation

protocol HomeScreenViewModel {
    var items: Observable<[HomeScreenCellConfig]> { get set }

    func getData(completion: @escaping () -> Void)
    func likeAd(id: Int)
    func detailView(at: Int)
}

class MockHomeScreenViewModel: HomeScreenViewModel {

    var items: Observable<[HomeScreenCellConfig]> = Observable([])

    private let queue = DispatchQueue.global(qos: .background)
    private let service: HomeScreenService
    private let coordinator: HomeCoordinator

    init(service: HomeScreenService, coordinator: HomeCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }

    func getData(completion: @escaping () -> Void) {
        queue.async { [weak self] in
            sleep(5)
            self?.service.getData { result in
                switch result {
                case .success(let newData):
                    DispatchQueue.main.async {
                        self?.items.value += newData
                        completion()
                    }

                case .failure:
                    #warning("must be alert")
                }
            }
        }
    }

    func likeAd(id: Int) {
        if let index = items.value.firstIndex(where: { $0.id == id }) {
            items.value[index].isLiked = !items.value[index].isLiked
        }
        service.likeAd(id: id)
    }

    func detailView(at id: Int) {
        coordinator.detailView(id: id)
    }
}
