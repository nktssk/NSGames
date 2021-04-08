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
        let responseBody = ["email": email]

        AF.request("http://localhost/forgotPassword/sendEmail",
                   method: .post,
                   parameters: responseBody,
                   encoder: JSONParameterEncoder.default)
            .validate(statusCode: 200..<300).responseJSON { response in
                if response.error == nil {
                    return completion(.failure(.wrongEmail))
                }
                return completion(.success(()))
            }
    }
}
