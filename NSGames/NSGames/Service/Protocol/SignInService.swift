//
//  SignInService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.03.2021.
//

import Foundation

protocol SignInService {
    func signIn(email: String, password: String, completion: @escaping (Result<(), SignInError>) -> Void)
}
