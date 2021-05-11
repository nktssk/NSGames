//
//  AuthRequestPath.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.04.2021.
//

import Foundation

enum AuthRequestPath {
    static let singIn = "http://192.168.0.100:80/signIn"
    static let singUp = "http://192.168.0.100:80/signUp"
    static let forgotPassword = "http://192.168.0.100:80/forgotPassword/sendEmail"
    static let changePassword = "http://192.168.0.100:80/forgotPassword/changePassword"
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
