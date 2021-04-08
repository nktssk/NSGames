//
//  User.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 03.04.2021.
//

import Foundation

struct AuthResponse: Codable {
    let user: UserResponse
    let token: String
}

struct UserResponse: Codable {
    let email: String
    let username: String
    let chatId: String
}

struct SignInForm: Codable {
    let email: String
    let password: String
}

struct SignUpForm: Codable {
    let email: String
    let password: String
    let username: String
}
