//
//  MockForgotPassword.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import Foundation
import Alamofire

class RestForgotPassword: ForgotPasswordServiceProtocol {
    func checkEmail(email: String, completion: @escaping (Result<(), ForgotPasswordError>) -> Void) {
        let responseBody = [ResponseBodyPropertyName.email: email]

        AF.request(AuthRequestPath.forgotPassword,
                   method: .post,
                   parameters: responseBody,
                   encoder: JSONParameterEncoder.default).response { response in
                    if response.error != nil {
                        return completion(.failure(.noConnection))
                    }
                    if response.response?.statusCode == 440 {
                        return completion(.failure(.wrongEmail))
                    }
                    if let statusCode = response.response?.statusCode, !(200...300).contains(statusCode) {
                        return completion(.failure(.wrongEmail))
                    }
                    return completion(.success(()))
        }
    }
}
