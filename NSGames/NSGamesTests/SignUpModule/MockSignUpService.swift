//
//  MockSignUpService.swift
//  NSGamesTests
//
//  Created by Nikita Sosyuk on 21.05.2021.
//

import Foundation
@testable import NSGames

class MockSignUpService: SignUpServiceProtocol {
    func signUp(username: String, email: String, password: String, completion: @escaping (Result<(), SignUpError>) -> Void) {
        return completion(.success(()))
    }
}
