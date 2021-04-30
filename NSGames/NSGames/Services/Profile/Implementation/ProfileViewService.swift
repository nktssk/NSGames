//
//  ProfileViewService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 09.04.2021.
//

import Foundation
import Alamofire

class ProfileViewService: ProfileViewServiceProtocol {

    func getUserInfo(completion: @escaping (Result<UserInfo, ProfileServiceError>) -> Void) {
        return completion(.success(UserInfo(username: "Nikita Sosyuk", email: "nikitashelov@gmail.com")))
    }

    func getAds(completion: @escaping (Result<[AdTableViewCellConfig], ProfileServiceError>) -> Void) {
        AF.request(ProfileRequestPath.ads,
                   method: .get,
                   parameters: nil,
                   headers: HeaderService.shared.getHeaders()).responseJSON(queue: DispatchQueue.global(qos: .userInitiated)) { response in
                    if response.error != nil {
                        return completion(.failure(.noConnection))
                    }
                    if let statusCode = response.response?.statusCode, !(200...300).contains(statusCode) {
                        return completion(.failure(.badRequest))
                    }
                    if let data = response.data {
                        do {
                            let ads = try JSONDecoder().decode([ProfileAdDto].self, from: data)
                            var configs = [AdTableViewCellConfig]()
                            for ad in ads {
                                configs.append(AdTableViewCellConfig(id: ad.id, name: ad.title, numberOfOffers: ad.countOffers, photo: ad.firstPhoto, views: ad.countViews))
                            }
                            return completion(.success(configs))
                        } catch {
                            return completion(.failure(.wrongData))
                        }
                    }
        }
    }
}
