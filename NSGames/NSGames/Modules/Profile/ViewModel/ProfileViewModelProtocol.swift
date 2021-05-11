//
//  ProfileViewModelProtocol.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.04.2021.
//

import Foundation

protocol ProfileViewModelProtocol {
    var items: Observable<[AdTableViewCellConfig]> { get set }
    var userInfo: Observable <UserInfo?> { get set }
    var error: Observable<String?> { get set }

    func quit()
    func setup()
    func deleteAd(index: Int)
    func didSelectItem(at: Int)
}

class ProfileViewModel: ProfileViewModelProtocol {

    var items: Observable<[AdTableViewCellConfig]> = Observable([])
    var userInfo: Observable<UserInfo?> = Observable(nil)
    var error: Observable<String?> = Observable(nil)

    private let service: ProfileViewServiceProtocol
    private let coordinator: ProfileCoordinator

    init(service: ProfileViewServiceProtocol, coordinator: ProfileCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }

    func setup() {
        service.getUserInfo { [weak self] result in
            switch result {
            case .success(let data):
                self?.userInfo.value = data

            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        service.getAds { [weak self] result in
            switch result {
            case .success(let data):
                self?.items.value = data

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func quit() {
        service.logout { [weak self] result in
            switch result {
            case .success:
                self?.coordinator.goToAuth()

            case .failure:
                self?.error.value = "Ошибка при выходе"
            }
        }
    }

    func didSelectItem(at index: Int) {
        let data = items.value[index]
        coordinator.goToDetailOfferView(id: data.id, name: data.name)
    }

    func deleteAd(index: Int) {
        let deletedAd = items.value[index]
        items.value.remove(at: index)
        service.deleteAd(id: deletedAd.id) { [weak self] result in

            switch result {
            case .success:
                break

            case .failure:
                self?.items.value.insert(deletedAd, at: index)
            }
        }
    }
}
