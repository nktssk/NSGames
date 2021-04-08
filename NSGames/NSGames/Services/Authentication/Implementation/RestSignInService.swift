//
//  MockSignInService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import Foundation
import Alamofire
import KeychainAccess

class RestSignInService: SignInServiceProtocol {
    func signIn(email: String, password: String, completion: @escaping (Result<(), SignInError>) -> Void) {
        let responseBody = [ResponseBodyPropertyName.email: email,
                            ResponseBodyPropertyName.password: password]

        AF.request(AuthRequestPath.singIn,
                   method: .post,
                   parameters: responseBody,
                   encoder: JSONParameterEncoder.default).responseJSON { response in
                    if response.error != nil {
                        return completion(.failure(.noConnection))
                    }
                    if let statusCode = response.response?.statusCode, !(200...300).contains(statusCode) {
                        return completion(.failure(.wrongData))
                    }
                    if let data = response.data {
                        do {
                            let data = try JSONDecoder().decode(SignInResponse.self, from: data)
                            KeychainService.saveToken(data.token)
                            KeychainService.saveChatId(data.user.chatId)
                            return completion(.success(()))
                        } catch {
                            return completion(.failure(.wrongData))
                        }
                    }
        }
    }
}
