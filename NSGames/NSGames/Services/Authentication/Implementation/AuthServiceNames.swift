//
//  AuthRequestPath.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.04.2021.
//

import Foundation

enum AuthRequestPath {
    static let singIn = "http://localhost/signIn"
    static let singUp = "http://localhost/signUp"
    static let forgotPassword = "http://localhost/forgotPassword/sendEmail"
    static let changePassword = "http://localhost/forgotPassword/changePassword"
}

enum ResponseBodyPropertyName {
    static let code = "code"
    static let email = "email"
    static let password = "password"
    static let username = "username"
}

struct SignInResponse: Decodable {
    let user: User
    let token: String
}

struct User: Decodable {
    let email: String
    let chatId: String
    let username: String
}
