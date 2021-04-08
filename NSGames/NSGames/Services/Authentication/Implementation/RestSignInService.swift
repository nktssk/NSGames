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
        let user = SignInForm(email: email, password: password)

        AF.request("http://localhost/signIn", method: .post, parameters: user, encoder: JSONParameterEncoder.default).responseJSON { response in
            if response.error != nil {
                return completion(.failure(.noConnection))
            }
            if let data = response.data {
                do {
                    let data = try JSONDecoder().decode(AuthResponse.self, from: data)
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
