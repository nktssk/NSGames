//
//  ProfileViewService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 09.04.2021.
//

import Foundation

class ProfileViewService: ProfileViewServiceProtocol {

    func getUserInfo(completion: @escaping (Result<UserInfo, Error>) -> Void) {
        return completion(.success(UserInfo(username: "Nikita Sosyuk", email: "nikitashelov@gmail.com")))
    }

    func getAds(completion: @escaping (Result<[AdTableViewCellConfig], Error>) -> Void) {

        return completion(.success([AdTableViewCellConfig(id: 10, name: "Red dead redemtion 2", numberOfOffers: 123, views: 1000)]))
    }
}
