//
//  MockSignInService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import Foundation

class MockSignInService: SignInServiceProtocol {
    func signIn(email: String, password: String, completion: @escaping (Result<(), SignInError>) -> Void) {
        if email == "123" && password == "123" {
            UserDefaults.standard.setValue(email, forKey: UserDefaultsNames.myId)
            return completion(.success(()))
        }
        if email == "12345" && password == "12345" {
            UserDefaults.standard.setValue(email, forKey: UserDefaultsNames.myId)
            return completion(.success(()))
        }
        if email == "1234" && password == "1234" {
            return completion(.failure(.wrongData))
        }
        return completion(.failure(.noConnection))
    }
}
