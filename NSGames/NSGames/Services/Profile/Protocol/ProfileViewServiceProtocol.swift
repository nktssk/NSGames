//
//  ProfileViewServiceProtocol.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 09.04.2021.
//

import Foundation

protocol ProfileViewServiceProtocol {
    func getUserInfo(completion: @escaping (Result<UserInfo, ProfileServiceError>) -> Void)
    func getAds(completion: @escaping (Result<[AdTableViewCellConfig], ProfileServiceError>) -> Void)
    func deleteAd(id: Int, completion: @escaping (Result<Void, ProfileServiceError>) -> Void)
    func logout(completion: @escaping (Result<Void, ProfileServiceError>) -> Void)
}
