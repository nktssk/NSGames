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

    func setup()
    func quit()
    func didSelectItem(at: Int)
}

class ProfileViewModel: ProfileViewModelProtocol {

    var items: Observable<[AdTableViewCellConfig]> = Observable([])
    var userInfo: Observable<UserInfo?> = Observable(nil)

    private let service: ProfileViewServiceProtocol
    private let coordinator: ProfileCoordinator

    init(service: ProfileViewServiceProtocol, coordinator: ProfileCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }

    func setup() {
        userInfo.value = UserInfo(username: "Nktlckr", email: "nikitashelov@gmail.com")
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
        coordinator.goToAuth()
    }

    func didSelectItem(at index: Int) {
        let data = items.value[index]
        coordinator.goToDetailOfferView(id: data.id, name: data.name)
    }
}
