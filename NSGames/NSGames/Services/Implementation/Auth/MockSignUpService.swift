//
//  MockSignUpService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import Foundation

class MockSignUpService: SignUpService {
    func signUp(login: String, email: String, password: String, completion: @escaping (Result<(), SignUpError>) -> Void) {
        if login == "123" && email == "123@gmail.com" {
            return completion(.success(()))
        }
        if login == "1234" && email == "1234@gmail.com" {
            return completion(.failure(.emailIsOccupied))
        }
        return completion(.failure(.noConnection))
    }
}
