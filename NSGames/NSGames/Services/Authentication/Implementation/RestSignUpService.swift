//
//  MockSignUpService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import Foundation
import Alamofire

class RestSignUpService: SignUpServiceProtocol {
    func signUp(username: String, email: String, password: String, completion: @escaping (Result<(), SignUpError>) -> Void) {
        let user = SignUpForm(email: email, password: password, username: username)

        AF.request("http://localhost/signUp", method: .post, parameters: user, encoder: JSONParameterEncoder.default).responseJSON { response in
//            response.statusCode
            if response.error != nil {
                return completion(.failure(.noConnection))
            }
            if let data = response.data {
                return completion(.success(()))
                do {
                    // TODO: - Error
                    let data = try JSONDecoder().decode(AuthResponse.self, from: data)
                    KeychainService.saveToken(data.token)
                    return completion(.success(()))
                } catch {
                    return completion(.success(()))
                }
            }
        }
    }
}
