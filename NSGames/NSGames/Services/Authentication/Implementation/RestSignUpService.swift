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
        let responseBody = [ResponseBodyPropertyName.email: email,
                            ResponseBodyPropertyName.password: password,
                            ResponseBodyPropertyName.username: username]

        AF.request(AuthRequestPath.singUp,
                   method: .post,
                   parameters: responseBody,
                   encoder: JSONParameterEncoder.default).responseJSON { response in
                    if response.error != nil {
                        return completion(.failure(.noConnection))
                    }
                    if response.response?.statusCode == 440 {
                        return completion(.failure(.emailIsOccupied))
                    }
                    if let statusCode = response.response?.statusCode, !(200...300).contains(statusCode) {
                        return completion(.failure(.badRequest))
                    }
                    return completion(.success(()))
        }
    }
}
