//
//  SignUp.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 09.03.2021.
//

import Foundation

protocol SignUpServiceProtocol {
    func signUp(username: String, email: String, password: String, completion: @escaping (Result<(), SignUpError>) -> Void)
}
