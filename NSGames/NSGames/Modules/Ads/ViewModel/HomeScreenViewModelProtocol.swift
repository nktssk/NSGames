//
//  HomeScreenViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import Foundation

protocol HomeScreenViewModelProtocol {
    var items: Observable<[AdCollectionViewCellConfig]> { get set }
    var error: Observable<String?> { get set }

    func getData(completion: @escaping () -> Void)
    func likeAd(id: Int)
    func detailView(at: Int)
}

class MockHomeScreenViewModel: HomeScreenViewModelProtocol {

    var items: Observable<[AdCollectionViewCellConfig]> = Observable([])
    var error: Observable<String?> = Observable(nil)

    private let queue = DispatchQueue.global(qos: .background)
    private let service: HomeScreenServiceProtocol
    private let coordinator: AdsCoordinatorProtocol

    init(service: HomeScreenServiceProtocol, coordinator: AdsCoordinatorProtocol) {
        self.service = service
        self.coordinator = coordinator
    }

    func getData(completion: @escaping () -> Void) {
        queue.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.service.getData { result in
                switch result {
                case .success(let newData):
                    DispatchQueue.main.async {
                        self?.items.value += newData
                        completion()
                    }

                case .failure:
                    break
                    // TODO: must be alert
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
        coordinator.goToDetailView(id: id)
    }
}