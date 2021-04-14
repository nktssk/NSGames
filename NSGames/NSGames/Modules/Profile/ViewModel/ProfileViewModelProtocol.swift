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
        items.value = [AdTableViewCellConfig(id: 100, name: "Red Dead Redemtion", numberOfOffers: 10, views: 500)]
        userInfo.value = UserInfo(username: "Nktlckr", email: "nikitashelov@gmail.com")
    }

    func didSelectItem(at index: Int) {
        let data = items.value[index]
        coordinator.goToDetailOfferView(id: data.id, name: data.name)
    }
}
