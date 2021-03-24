//
//  SignUp.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 09.03.2021.
//

import Foundation

protocol SignUpService {
    func signUp(login: String, email: String, password: String, completion: @escaping (Result<(), SignUpError>) -> Void)
}
