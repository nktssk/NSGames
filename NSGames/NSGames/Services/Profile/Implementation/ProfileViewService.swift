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
        AF.request(ProfileRequestPath.userInfo,
                   method: .get,
                   headers: HeaderService.shared.getHeaders()).responseJSON(queue: DispatchQueue.global(qos: .userInitiated)) { response in
                    if response.error != nil {
                        return completion(.failure(.noConnection))
                    }
                    if let statusCode = response.response?.statusCode, !(200...300).contains(statusCode) {
                        return completion(.failure(.badRequest))
                    }
                    if let data = response.data {
                        do {
                            let userInfo = try JSONDecoder().decode(UserInfo.self, from: data)
                            return completion(.success(userInfo))
                        } catch {
                            return completion(.failure(.wrongData))
                        }
                    }
        }
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
                            let ads = try MyJSONDecoder().decode([ProfileAdDto].self, from: data)
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

    func deleteAd(id: Int, completion: @escaping (Result<Void, ProfileServiceError>) -> Void) {
        AF.request(ProfileRequestPath.delete + "/\(id)",
                   method: .delete,
                   headers: HeaderService.shared.getHeaders()).responseJSON(queue: DispatchQueue.global(qos: .userInitiated)) { response in
                    if response.error != nil {
                        return completion(.failure(.noConnection))
                    }
                    if let statusCode = response.response?.statusCode, !(200...300).contains(statusCode) {
                        return completion(.failure(.badRequest))
                    }
                    return completion(.success(()))
        }
    }

    func logout(completion: @escaping (Result<Void, ProfileServiceError>) -> Void) {
        AF.request(ProfileRequestPath.logout,
                   method: .post,
                   headers: HeaderService.shared.getHeaders()).responseJSON(queue: DispatchQueue.global(qos: .userInitiated)) { response in
                    if response.error != nil {
                        if !response.error!.isResponseSerializationError {
                            return completion(.failure(.noConnection))
                        }
                    }
                    if let statusCode = response.response?.statusCode, !(200...300).contains(statusCode) {
                        return completion(.failure(.badRequest))
                    }
                    DispatchQueue.main.async {
                        return completion(.success(()))
                    }
        }
    }
}
