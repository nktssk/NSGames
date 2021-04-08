//
//  ProfileViewModelProtocol.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.04.2021.
//

import Foundation

protocol ProfileViewModelProtocol {
    var items: Observable<[Ad]> { get set }
    var userInfo: Observable <UserInfo?> { get set }

    func setup()
    func didSelectItem(at: Int)
}

class ProfileViewModel: ProfileViewModelProtocol {

    var items: Observable<[Ad]> = Observable([])

    var userInfo: Observable<UserInfo?> = Observable(nil)

    func setup() {
        items.value = [Ad(id: 100, name: "Red Dead Redemtion", numberOfOffers: 10, views: 500)]
    }

    func didSelectItem(at: Int) {
        print("LOL И ЧО")
    }
}
