//
//  MockGameService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import UIKit
import Alamofire

class GameService: GameServiceProtocol {
    func getStringData(id: Int, completion: @escaping (Result<GameSreenConfig, AdServiceError>) -> Void) {

        AF.request(AdsRequestPath.detail,
                   method: .post,
                   parameters: ["id": id],
                   encoder: JSONParameterEncoder.default,
                   headers: HeaderService.shared.getHeaders()).responseJSON(queue: DispatchQueue.global(qos: .userInitiated)) { response in
                    if response.error != nil {
                        return completion(.failure(.noConnection))
                    }
                    if let statusCode = response.response?.statusCode, !(200...300).contains(statusCode) {
                        return completion(.failure(.badRequest))
                    }
                    if let data = response.data {
                        do {
                            let ad = try JSONDecoder().decode(AdDetailDto.self, from: data)
                            let result = GameSreenConfig(id: ad.id, title: ad.title, description: ad.description, messageId: ad.chatId, price: ad.price, date: Date(), username: ad.username, photoNames: ad.photoNames)
                            return completion(.success(result))
                        } catch {
                            return completion(.failure(.wrongData))
                        }
                    }
        }
    }
}
