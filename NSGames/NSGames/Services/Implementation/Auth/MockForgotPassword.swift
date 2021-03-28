//
//  MockForgotPassword.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import Foundation

class MockForgotPassword: ForgotPasswordServiceProtocol {
    func checkEmail(email: String, completion: @escaping (Result<(), ForgotPasswordError>) -> Void) {
        if email == "abc" {
            completion(.success(()))
        } else {
            completion(.failure(.wrongEmail))
        }
    }
}
